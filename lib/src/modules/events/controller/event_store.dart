// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:challenge/src/core/local_data_source/storage_service_impl.dart';
import 'package:challenge/src/core/remote_data_source/errors/handle_erros.dart';
import 'package:mobx/mobx.dart';

import 'package:challenge/src/core/local_data_source/storage_service.dart';
import 'package:challenge/src/modules/events/models/event_model.dart';
import 'package:challenge/src/modules/events/service/service_interface.dart';

part 'event_store.g.dart';

class EventStore = _EventStoreBase with _$EventStore;

abstract class _EventStoreBase with Store {
  final ServiceInterface service;
  StorageServiceImpl prefs = StorageServiceImpl();

  _EventStoreBase({
    required this.service,
  });

//State Loading
  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

//State Error
  @observable
  bool isError = false;

  @action
  void setIsError(bool value) => isError = value;

  //States get events
  @action
  void initialStateLoading() {
    setIsError(false);
    setIsLoading(true);
  }

  @action
  void endStateLoading() {
    setIsLoading(false);
    setIsError(false);
  }

  @observable
  bool isConnected = false;
  @action
  void setIsConnected(bool value) => isConnected = value;

  @observable
  String status = '';
  @action
  void setStatus(String value) => status = value;

  @observable
  List<EventModel> softEventList = [];

  @action
  void setSoftEventList(List<EventModel> value) => softEventList = value;

  @action
  Future<void> getSoftEventList() async {
    try {
      initialStateLoading();
      final result = await service.getCharacters();
      setSoftEventList(result);
      endStateLoading();
    } on NotFoundException {
      throw 'Página não encontrada';
    } on ForbiddenException {
      throw 'Sem permissão para acessar a página';
    } on InternalServerException {
      throw 'Erro interno do servidor';
    } on GenericException {
      throw 'Ocorreu um erro, tente novamente';
    } finally {
      setIsLoading(false);
      setIsError(true);
    }
  }

  @observable
  List<EventModel> favoriteEventList = [];

  @action
  void setFavoriteEventList(List<EventModel> value) =>
      favoriteEventList = value;

  @action
  void addFavoriteItemList(EventModel model) {
    try {
      favoriteEventList.add(model);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> addFavoriteListToPrefs() async {
    await prefs.setStringList(favoriteEventList);
  }

  @action
  Future<void> loadFavoriteList() async {
    try {
      initialStateLoading();
      final result = await prefs.getStringList();
      favoriteEventList = result;
      endStateLoading();
    } catch (_) {
      setIsLoading(false);
      setIsError(true);
    }
  }
}

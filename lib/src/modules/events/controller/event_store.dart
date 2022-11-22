import 'dart:developer';

import 'package:challenge/src/modules/events/models/event_model.dart';
import 'package:mobx/mobx.dart';

import 'package:challenge/src/modules/events/service/service_interface.dart';

part 'event_store.g.dart';

class EventStore = _EventStoreBase with _$EventStore;

abstract class _EventStoreBase with Store {
  final ServiceInterface service;

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
  List<EventModel> softEventList = [];

  @action
  void setSoftEventList(List<EventModel> value) => softEventList = value;

  @action
  Future<void> getSoftEventList() async {
    try {
      initialStateLoading();
      final result = await service.getCharacters();
      setSoftEventList(result);
      inspect(result);
      endStateLoading();
    } catch (_) {
      setIsLoading(false);
      setIsError(true);
    }
  }
}

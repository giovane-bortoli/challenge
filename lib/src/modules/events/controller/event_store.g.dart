// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventStore on _EventStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EventStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_EventStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$softEventListAtom =
      Atom(name: '_EventStoreBase.softEventList', context: context);

  @override
  List<EventModel> get softEventList {
    _$softEventListAtom.reportRead();
    return super.softEventList;
  }

  @override
  set softEventList(List<EventModel> value) {
    _$softEventListAtom.reportWrite(value, super.softEventList, () {
      super.softEventList = value;
    });
  }

  late final _$getSoftEventListAsyncAction =
      AsyncAction('_EventStoreBase.getSoftEventList', context: context);

  @override
  Future<void> getSoftEventList() {
    return _$getSoftEventListAsyncAction.run(() => super.getSoftEventList());
  }

  late final _$_EventStoreBaseActionController =
      ActionController(name: '_EventStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_EventStoreBaseActionController.startAction(
        name: '_EventStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_EventStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsError(bool value) {
    final _$actionInfo = _$_EventStoreBaseActionController.startAction(
        name: '_EventStoreBase.setIsError');
    try {
      return super.setIsError(value);
    } finally {
      _$_EventStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialStateLoading() {
    final _$actionInfo = _$_EventStoreBaseActionController.startAction(
        name: '_EventStoreBase.initialStateLoading');
    try {
      return super.initialStateLoading();
    } finally {
      _$_EventStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void endStateLoading() {
    final _$actionInfo = _$_EventStoreBaseActionController.startAction(
        name: '_EventStoreBase.endStateLoading');
    try {
      return super.endStateLoading();
    } finally {
      _$_EventStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSoftEventList(List<EventModel> value) {
    final _$actionInfo = _$_EventStoreBaseActionController.startAction(
        name: '_EventStoreBase.setSoftEventList');
    try {
      return super.setSoftEventList(value);
    } finally {
      _$_EventStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
softEventList: ${softEventList}
    ''';
  }
}

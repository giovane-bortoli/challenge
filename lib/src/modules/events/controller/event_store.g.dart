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

  late final _$isConnectedAtom =
      Atom(name: '_EventStoreBase.isConnected', context: context);

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_EventStoreBase.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
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

  late final _$favoriteEventListAtom =
      Atom(name: '_EventStoreBase.favoriteEventList', context: context);

  @override
  List<EventModel> get favoriteEventList {
    _$favoriteEventListAtom.reportRead();
    return super.favoriteEventList;
  }

  @override
  set favoriteEventList(List<EventModel> value) {
    _$favoriteEventListAtom.reportWrite(value, super.favoriteEventList, () {
      super.favoriteEventList = value;
    });
  }

  late final _$getSoftEventListAsyncAction =
      AsyncAction('_EventStoreBase.getSoftEventList', context: context);

  @override
  Future<void> getSoftEventList() {
    return _$getSoftEventListAsyncAction.run(() => super.getSoftEventList());
  }

  late final _$addFavoriteListToPrefsAsyncAction =
      AsyncAction('_EventStoreBase.addFavoriteListToPrefs', context: context);

  @override
  Future<void> addFavoriteListToPrefs() {
    return _$addFavoriteListToPrefsAsyncAction
        .run(() => super.addFavoriteListToPrefs());
  }

  late final _$loadFavoriteListAsyncAction =
      AsyncAction('_EventStoreBase.loadFavoriteList', context: context);

  @override
  Future<void> loadFavoriteList() {
    return _$loadFavoriteListAsyncAction.run(() => super.loadFavoriteList());
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
  void setIsConnected(bool value) {
    final _$actionInfo = _$_EventStoreBaseActionController.startAction(
        name: '_EventStoreBase.setIsConnected');
    try {
      return super.setIsConnected(value);
    } finally {
      _$_EventStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(String value) {
    final _$actionInfo = _$_EventStoreBaseActionController.startAction(
        name: '_EventStoreBase.setStatus');
    try {
      return super.setStatus(value);
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
  void setFavoriteEventList(List<EventModel> value) {
    final _$actionInfo = _$_EventStoreBaseActionController.startAction(
        name: '_EventStoreBase.setFavoriteEventList');
    try {
      return super.setFavoriteEventList(value);
    } finally {
      _$_EventStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFavoriteItemList(EventModel model) {
    final _$actionInfo = _$_EventStoreBaseActionController.startAction(
        name: '_EventStoreBase.addFavoriteItemList');
    try {
      return super.addFavoriteItemList(model);
    } finally {
      _$_EventStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
isConnected: ${isConnected},
status: ${status},
softEventList: ${softEventList},
favoriteEventList: ${favoriteEventList}
    ''';
  }
}

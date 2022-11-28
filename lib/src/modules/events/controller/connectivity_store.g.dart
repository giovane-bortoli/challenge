// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectivityStore on _ConnectivityStoreBase, Store {
  late final _$connectionStatusAtom =
      Atom(name: '_ConnectivityStoreBase.connectionStatus', context: context);

  @override
  ConnectivityResult get connectionStatus {
    _$connectionStatusAtom.reportRead();
    return super.connectionStatus;
  }

  @override
  set connectionStatus(ConnectivityResult value) {
    _$connectionStatusAtom.reportWrite(value, super.connectionStatus, () {
      super.connectionStatus = value;
    });
  }

  late final _$initConnectivityAsyncAction =
      AsyncAction('_ConnectivityStoreBase.initConnectivity', context: context);

  @override
  Future<void> initConnectivity() {
    return _$initConnectivityAsyncAction.run(() => super.initConnectivity());
  }

  late final _$updateConnectionAsyncAction =
      AsyncAction('_ConnectivityStoreBase.updateConnection', context: context);

  @override
  Future<void> updateConnection(ConnectivityResult result) {
    return _$updateConnectionAsyncAction
        .run(() => super.updateConnection(result));
  }

  @override
  String toString() {
    return '''
connectionStatus: ${connectionStatus}
    ''';
  }
}

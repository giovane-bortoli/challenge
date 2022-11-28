import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';
part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStoreBase with _$ConnectivityStore;

abstract class _ConnectivityStoreBase with Store {
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  final Connectivity connectivity = Connectivity();

  @observable
  ConnectivityResult connectionStatus = ConnectivityResult.none;

  @action
  Future<void> initConnectivity() async {
    final result = await connectivity.checkConnectivity();
    updateConnection(result);
    connectivity.onConnectivityChanged.listen((event) {
      updateConnection(event);
    });
  }

  @action
  Future<void> updateConnection(ConnectivityResult result) async {
    connectionStatus = result;
  }
}

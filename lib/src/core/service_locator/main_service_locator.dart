import 'package:challenge/src/core/database/database_client.dart';
import 'package:challenge/src/core/database/database_impl.dart';
import 'package:challenge/src/core/local_data_source/storage_service.dart';
import 'package:challenge/src/core/local_data_source/storage_service_impl.dart';
import 'package:challenge/src/core/remote_data_source/api_client.dart';
import 'package:challenge/src/core/remote_data_source/dio_impl.dart';
import 'package:challenge/src/core/service_locator/service_locator.dart';
import 'package:challenge/src/modules/auth/controller/auth_store.dart';
import 'package:challenge/src/modules/auth/service/auth_service.dart';
import 'package:challenge/src/modules/auth/service/auth_service_interface.dart';

import 'package:challenge/src/modules/characters/controller/home_controller.dart';
import 'package:challenge/src/modules/characters/service/service.dart';
import 'package:challenge/src/modules/characters/service/service_interface.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainServiceLocator {
  static final locator = ServiceLocator.locator;

  static void init() {
    //firebase instance
    locator.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);

    //firebase interface
    locator.registerFactory<AuthServiceInterface>(
        () => AuthService(auth: locator.get<DatabaseClient>()));
    //firebase impl
    locator.registerFactory<DatabaseClient>(
        () => DatabaseImpl(auth: locator.get<FirebaseAuth>()));

    locator.registerFactory<FlutterSecureStorage>(
        () => const FlutterSecureStorage());

    locator.registerFactory<StorageService>(() => StorageServiceImpl(
          storage: locator.get<FlutterSecureStorage>(),
        ));

    locator.registerFactory<Dio>(() => Dio());

    //service interface
    locator.registerFactory<ServiceInterface>(
        () => Services(client: locator.get<ApiClient>()));

    //service implementation
    locator.registerFactory<ApiClient>(() => DioImpl(
          dio: locator.get<Dio>(),
        ));

    locator.registerFactory<HomeController>(() => HomeController(
          services: locator.get<ServiceInterface>(),
        ));

    locator.registerFactory<AuthStore>(
        () => AuthStore(auth: locator.get<AuthServiceInterface>()));
  }
}

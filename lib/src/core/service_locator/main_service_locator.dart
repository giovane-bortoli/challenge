import 'package:challenge/src/core/database/database_client.dart';
import 'package:challenge/src/core/database/database_impl.dart';
import 'package:challenge/src/core/remote_data_source/api_client.dart';
import 'package:challenge/src/core/remote_data_source/dio_impl.dart';
import 'package:challenge/src/core/service_locator/service_locator.dart';
import 'package:challenge/src/modules/auth/controller/auth_store.dart';
import 'package:challenge/src/modules/auth/service/auth_service.dart';
import 'package:challenge/src/modules/auth/service/auth_service_interface.dart';
import 'package:challenge/src/modules/events/controller/connectivity_store.dart';
import 'package:challenge/src/modules/events/controller/event_store.dart';

import 'package:challenge/src/modules/events/service/service.dart';
import 'package:challenge/src/modules/events/service/service_interface.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

    locator.registerFactory<Dio>(() => Dio());

    //service interface
    locator.registerFactory<ServiceInterface>(
        () => Services(client: locator.get<ApiClient>()));

    //service implementation
    locator.registerFactory<ApiClient>(() => DioImpl(
          dio: locator.get<Dio>(),
        ));

    locator.registerFactory<AuthStore>(
        () => AuthStore(auth: locator.get<AuthServiceInterface>()));
    locator.registerFactory<ConnectivityStore>(() => ConnectivityStore());

    locator.registerSingleton<EventStore>(EventStore(
      service: locator.get<ServiceInterface>(),
    ));
  }
}

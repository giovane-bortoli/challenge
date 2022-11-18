import 'package:challenge/src/core/service_locator/main_service_locator.dart';
import 'package:get_it/get_it.dart';

class ServiceLocator {
  static final GetIt locator = GetIt.instance;

  static void initLocator() {
    MainServiceLocator.init();
  }
}

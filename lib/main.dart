import 'package:challenge/challenge_app.dart';
import 'package:challenge/src/core/service_locator/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLibraries();
  runApp(const MyApp());
}

Future<void> setupLibraries() async {
  //firebase
  await Firebase.initializeApp();

  //Dependencies
  ServiceLocator.initLocator();

  //enviroment
  await dotenv.load(fileName: ".env");
}

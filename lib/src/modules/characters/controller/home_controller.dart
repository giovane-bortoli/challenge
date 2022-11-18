// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:challenge/src/modules/characters/service/service_interface.dart';

class HomeController extends ChangeNotifier {
  final ServiceInterface services;
  HomeController({
    required this.services,
  });

  Future<void> getCharacters() async {
    final response = await services.getCharacters();
    inspect(response);
  }
}

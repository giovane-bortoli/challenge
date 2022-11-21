// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:challenge/src/core/remote_data_source/api_client.dart';
import 'package:challenge/src/modules/events/models/event_model.dart';

import 'package:challenge/src/modules/events/service/service_interface.dart';

import 'package:challenge/src/shared/utils/app_configs.dart';

class Services implements ServiceInterface {
  final ApiClient client;
  Services({
    required this.client,
  });

  @override
  Future<EventModel> getCharacters() async {
    final response = await client.getRequest('${AppConfigs.baseUrl}/character');
    inspect(response);
    switch (response.statusCode) {
      case 200:
        return EventModel.fromJson(response.data);
    }

    throw UnimplementedError();
  }
}

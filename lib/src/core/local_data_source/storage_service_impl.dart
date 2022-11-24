// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:challenge/src/modules/events/models/event_model.dart';
import 'package:challenge/src/core/local_data_source/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServiceImpl implements StorageService {
  static const String eventKey = 'events';

  @override
  Future<List<EventModel>> getStringList() async {
    final prefs = await SharedPreferences.getInstance();
    final eventSerialized = prefs.getStringList(eventKey);
    if (eventSerialized != null) {
      final getEventList = List<Map<String, dynamic>>.from(
          eventSerialized.map((e) => jsonDecode(e)));
      return getEventList.map(EventModel.fromJson).toList();
    }

    return [];
  }

  @override
  Future<void> setStringList(List<EventModel> eventModel) async {
    final prefs = await SharedPreferences.getInstance();
    final eventList = eventModel.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(eventKey, eventList);
  }
}

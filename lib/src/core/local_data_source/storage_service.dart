import 'package:challenge/src/modules/events/models/event_model.dart';

abstract class StorageService {
  Future<List<EventModel>> getStringList();

  Future<void> setStringList(List<EventModel> eventmodel);
}

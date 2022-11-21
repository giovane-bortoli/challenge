import 'package:challenge/src/modules/events/models/event_model.dart';

abstract class ServiceInterface {
  Future<EventModel> getCharacters();
}

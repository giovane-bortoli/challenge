import 'package:challenge/src/modules/characters/models/character_model.dart';

abstract class ServiceInterface {
  Future<CharacterModel> getCharacters();
}

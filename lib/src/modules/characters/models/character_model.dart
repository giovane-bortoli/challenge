// ignore_for_file: public_member_api_docs, sort_constructors_first
class CharacterModel {
  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List<String> characters;
  final String? url;
  final String? created;
  CharacterModel({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    required this.characters,
    this.url,
    this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      airDate: json['airDate'],
      episode: json['episode'],
      characters: json['character'] ?? <String>[],
      url: json['url'],
      created: json['created'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['airDate'] = airDate;
    data['episode'] = episode;
    data['characters'] = characters;
    data['url'] = url;
    data['created'] = created;

    return data;
  }
}

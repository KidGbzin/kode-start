import 'location_info_entity.dart';

class Character {
  
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationInfo origin;
  final LocationInfo location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      species: map['species'],
      type: map['type'],
      gender: map['gender'],
      origin: LocationInfo.fromMap(map['origin']),
      location: LocationInfo.fromMap(map['location']),
      image: map['image'],
      episode: List<String>.from(map['episode']),
      url: map['url'],
      created: map['created'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toMap(),
      'location': location.toMap(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }
}
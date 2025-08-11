import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/src/core/entities/location_info_entity.dart';

void main() {
  group('LocationInfo', () {
    final locationMap = {
      "name": "Earth (Replacement Dimension)",
      "url": "https://rickandmortyapi.com/api/location/20"
    };

    test('fromMap should create a valid LocationInfo instance', () {
      final location = LocationInfo.fromMap(locationMap);

      expect(location.name, "Earth (Replacement Dimension)");
      expect(location.url, "https://rickandmortyapi.com/api/location/20");
    });

    test('toMap should return a valid Map representation', () {
      final location = LocationInfo.fromMap(locationMap);
      final map = location.toMap();

      expect(map, locationMap);
    });
  });
}
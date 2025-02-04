import 'package:test/test.dart';
import 'package:weather_app_flutter/models/city.dart';
import 'package:weather_app_flutter/repositories/city_repository.dart';

void main() {
  late CityRepository repository;

  setUp(() {
    repository = CityRepository();
  });

  group('CityRepository Tests', () {
    test('repository.cities should return a List<City>', () {
      expect(repository.cities, isA<List<City>>());
    });

    test('getCityByName return a List<City> with "Rio de Janeiro"', () async {
      final list = await repository.getCityByName("Rio de Janeiro");

      expect(list, isA<List<City>>());

      expect(list.any((city) => city.name == "Rio de Janeiro"), isTrue);
    });
  });
}

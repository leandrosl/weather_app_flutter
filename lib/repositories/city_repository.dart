import 'dart:async';

import '../models/city.dart';

class CityRepository {
  final List<City> _cities = [
    City(
      name: "Belo Horizonte",
      state: "Minas Gerais",
      country: "Brazil",
      temperature: 23.0,
    ),
    City(
      name: "Rio de Janeiro",
      state: "Rio de Janeiro",
      country: "Brazil",
      temperature: 34.0,
    ),
    City(
      name: "Porto Alegre",
      state: "Rio Grande do Sul",
      country: "Brazil",
      temperature: 18.0,
    ),
  ];

  List<City> get cities => _cities;

  Future<List<City>> getCityByName(String name) async {
    await Future.delayed(const Duration(seconds: 2));

    return _cities
        .where((city) => city.name!.toLowerCase().contains(name))
        .toList();
  }
}

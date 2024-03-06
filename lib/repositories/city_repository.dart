import 'dart:async';

import 'package:weather_app_flutter/models/city.dart';

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

  Future<List<City>> getCityByName(String name) async {
    await Future.delayed(const Duration(seconds: 2));

    final results = _cities.takeWhile((city) => city.name!.contains(name));

    if (results.isEmpty) {
      throw Exception("Nenhuma cidade encontrada");
    }

    return results.toList();
  }
}

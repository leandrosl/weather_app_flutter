import 'package:flutter/material.dart';

import '../models/city.dart';
import '../repositories/city_repository.dart';

class CityViewModel extends ChangeNotifier {
  final CityRepository _repository = CityRepository();

  late List<City> _listCities;
  List<City> get cities => _listCities;

  late City _selectedCity;
  City get selectedCity => _selectedCity;

  CityViewModel() {
    _listCities = _repository.cities;
    _selectedCity = _listCities[0];
  }

  void changeCity(City city) {
    _selectedCity = city;
    notifyListeners();
  }
}

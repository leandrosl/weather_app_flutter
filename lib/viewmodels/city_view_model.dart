import 'package:flutter/material.dart';

import '../models/city.dart';
import '../repositories/city_repository.dart';

enum CityViewModelState { initial, loading, success }

class CityViewModel extends ChangeNotifier {
  final CityRepository _repository = CityRepository();

  late List<City> _listCities;
  List<City> get cities => _listCities;

  late City? _selectedCity;
  City? get selectedCity => _selectedCity;

  late CityViewModelState _state;
  CityViewModelState get state => _state;

  CityViewModel() {
    _listCities = _repository.cities;
    _selectedCity = _listCities[0];
    _state = CityViewModelState.initial;
  }

  void changeCity(City city) {
    _state = CityViewModelState.loading;
    notifyListeners();

    _selectedCity = city;
    notifyListeners();

    _state = CityViewModelState.success;
    notifyListeners();
  }

  Future<void> getCitiesByName(String name) async {
    _state = CityViewModelState.loading;
    notifyListeners();

    _listCities = await _repository.getCityByName(name);
    notifyListeners();

    _state = CityViewModelState.success;
    notifyListeners();
  }
}

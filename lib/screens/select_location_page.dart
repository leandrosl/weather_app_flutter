import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_flutter/viewmodels/city_view_model.dart';

import '../models/city.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({super.key});

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: TextField(
          decoration: const InputDecoration(
            labelText: 'Digite uma cidade',
          ),
          onChanged: (text) {
            setState(() {
              //_cities = _cityRepository.getCityByName(text);
            });
          },
        ),
      ),
      body: Consumer<CityViewModel>(
        builder: (context, value, child) {
          if (value.state == CityViewModelState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          /*if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }*/

          if (value.state == CityViewModelState.success &&
              value.cities.isEmpty) {
            return const Center(
              child: Text("Nenhuma cidade encontrada"),
            );
          }

          return ListView.builder(
            itemCount: value.cities.length,
            itemBuilder: (listBuilderContext, listIndex) {
              return CityListItem(city: value.cities[listIndex]);
            },
          );
        },
      ),
    );
  }
}

class CityListItem extends StatelessWidget {
  const CityListItem({super.key, required this.city});

  final City city;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on),
      title: Text(
        "${city.name}",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "${city.state}, ${city.country}",
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

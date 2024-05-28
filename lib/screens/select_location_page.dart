import 'package:flutter/material.dart';

import '../repositories/city_repository.dart';

import '../models/city.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({super.key});

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  late CityRepository _cityRepository;

  late Future<List<City>> _cities;

  @override
  void initState() {
    super.initState();
    _cityRepository = CityRepository();
    _cities = _cityRepository.getCityByName("");
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
              _cities = _cityRepository.getCityByName(text);
            });
          },
        ),
      ),
      body: FutureBuilder<List<City>>(
        future: _cities,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Nenhuma cidade encontrada"),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (listBuilderContext, listIndex) {
              return CityListItem(city: snapshot.data![listIndex]);
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

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
        title: const TextField(
          decoration: InputDecoration(
            labelText: 'Digite uma cidade',
          ),
        ),
      ),
      body: FutureBuilder<List<City>>(
        future: _cities,
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (listBuilderContext, listIndex) {
                return ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(
                    "${snapshot.data![listIndex].name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${snapshot.data![listIndex].state}, ${snapshot.data![listIndex].country}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

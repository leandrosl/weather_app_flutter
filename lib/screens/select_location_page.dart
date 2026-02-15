import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/settings_page.dart';
import '../viewmodels/city_view_model.dart';
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

  void _changeCity(City city) {
    context.read<CityViewModel>().changeCity(city);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Cidades",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            tooltip: 'Search',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
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
              //return CityListItem(city: value.cities[listIndex]);
              return InkWell(
                onTap: () => _changeCity(value.cities[listIndex]),
                child: CityListItem(city: value.cities[listIndex]),
              );
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
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(
        horizontal: 16.0,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${city.name}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "${city.state}, ${city.country}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '26°',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            '16° | 26°',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

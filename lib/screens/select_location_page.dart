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
        backgroundColor: Colors.blueAccent,
        title: TextField(
          decoration: const InputDecoration(
            labelText: 'Digite uma cidade',
          ),
          onChanged: (text) async {
            //TODO: ver porque as vezes aparece como vazio antes de aparecer a lista
            await context.read<CityViewModel>().getCitiesByName(text);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
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

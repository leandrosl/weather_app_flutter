import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/city_view_model.dart';
import '../models/city.dart';
import '../screens/select_location_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    City? selectedCity = context.watch<CityViewModel>().selectedCity;

    return MediaQuery.of(context).orientation == Orientation.portrait
        ? _HomePagePortrait(selectedCity: selectedCity)
        : _HomePageLandscape();
  }
}

class _HomePagePortrait extends StatelessWidget {
  _HomePagePortrait({this.selectedCity});

  City? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: selectedCity != null
                  ? _ShowCityWidgetPortrait(
                      city: selectedCity,
                    )
                  : _NoSelectedCityWidgetPortrait(),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SelectLocationPage(),
                  ),
                );
              },
              backgroundColor: Colors.white,
              child: const Icon(Icons.search),
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _ShowCityWidgetPortrait extends StatelessWidget {
  _ShowCityWidgetPortrait({this.city});

  City? city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            '${city?.name}, ${city?.state} - ${city?.country}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 32.0,
            ),
          ),
        ),
        const Expanded(
          child: Icon(
            Icons.sunny,
            color: Colors.amberAccent,
            size: 164.0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(32.0),
          child: Text(
            '27° C',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 28.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _NoSelectedCityWidgetPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Clique no botão 'Buscar' para selecionar uma cidade",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 24.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _HomePageLandscape extends StatelessWidget {
  _HomePageLandscape({this.selectedCity});

  City? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Landscape"),
    );
  }
}

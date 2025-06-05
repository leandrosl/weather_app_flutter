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
        : _HomePageLandscape(selectedCity: selectedCity);
  }
}

class _HomePagePortrait extends StatelessWidget {
  const _HomePagePortrait({this.selectedCity});

  final City? selectedCity;

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
                  ? _ShowCityWidgetPortrait(city: selectedCity)
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
  const _ShowCityWidgetPortrait({this.city});

  final City? city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4.0,
                children: [
                  const Icon(
                    Icons.pin_drop,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    '${city?.name}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Expanded(
          child: Icon(
            Icons.sunny,
            color: Colors.amberAccent,
            size: 164.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            '${city?.temperature}° C',
            style: const TextStyle(
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
  const _HomePageLandscape({this.selectedCity});

  final City? selectedCity;

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
                  ? _ShowCityWidgetLandscape(city: selectedCity)
                  : _NoSelectedCityWidgetLandscape(),
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
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _ShowCityWidgetLandscape extends StatelessWidget {
  const _ShowCityWidgetLandscape({this.city});

  final City? city;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${city?.name}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 32.0,
                ),
              ),
              Text(
                "${city?.state}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 32.0,
                ),
              ),
              Text(
                "${city?.country}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 32.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sunny,
                color: Colors.amberAccent,
                size: 164.0,
              ),
              Text(
                '${city?.temperature}° C',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 28.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NoSelectedCityWidgetLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Clique no botão 'Buscar' para selecionar uma cidade",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 28.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

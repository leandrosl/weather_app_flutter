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
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4.0,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 24.0,
            ),
            Text(
              '${selectedCity?.name}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${selectedCity?.temperature?.toInt()}°',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 72.0,
                          ),
                        ),
                        const Text(
                          'Limpo',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: Icon(
                        Icons.sunny,
                        color: Colors.amberAccent,
                        size: 132.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 32.0,
              child: Row(
                spacing: 4.0,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    '${selectedCity?.name}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${selectedCity?.temperature?.toInt()}°',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 72.0,
                              ),
                            ),
                            const Text(
                              'Limpo',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: Icon(
                            Icons.sunny,
                            color: Colors.amberAccent,
                            size: 132.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

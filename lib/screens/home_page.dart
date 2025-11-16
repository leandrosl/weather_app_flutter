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
            horizontal: 32.0,
            vertical: 4.0,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.sunny,
                        color: Colors.amberAccent,
                        size: 132.0,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsetsGeometry.only(top: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '28° | 14°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sensação térmica de 27°',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              NextDaysTemperaturesCard(),
              const SizedBox(
                height: 12.0,
              ),
              AirQualityCard(),
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

class NextDaysTemperaturesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
        child: Column(
          spacing: 10.0,
          children: [
            NextDayTemperatureItem(),
            NextDayTemperatureItem(),
            NextDayTemperatureItem(),
            NextDayTemperatureItem(),
            NextDayTemperatureItem(),
          ],
        ),
      ),
    );
  }
}

class NextDayTemperatureItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text("Seg."),
        ),
        Text("26°"),
        SizedBox(
          width: 4.0,
        ),
        Text("16°"),
      ],
    );
  }
}

class AirQualityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 12.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10.0,
            children: [
              const Text(
                "Qualidade do Ar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Text(
                "Moderada(77)",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 16.0,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 120.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade400,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

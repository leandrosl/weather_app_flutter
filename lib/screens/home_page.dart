import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/city_view_model.dart';
import '../models/city.dart';
import '../screens/select_location_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedCity = context.read<CityViewModel>().selectedCity;

    return Container(
      color: Colors.blueAccent,
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ShowCityWidget(
                city: selectedCity,
              ),
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

class ShowCityWidget extends StatelessWidget {
  const ShowCityWidget({super.key, required this.city});

  final City city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            '${city.name}, ${city.state} - ${city.country}',
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

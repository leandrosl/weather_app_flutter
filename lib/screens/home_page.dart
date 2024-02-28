import 'package:flutter/material.dart';

import '../screens/select_location_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      constraints: const BoxConstraints.expand(),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      'São Paulo, SP - Brazil',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 32.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.sunny,
                      color: Colors.amberAccent,
                      size: 164.0,
                    ),
                  ),
                  Padding(
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

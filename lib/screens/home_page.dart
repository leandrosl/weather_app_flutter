import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      constraints: const BoxConstraints.expand(),
      child: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
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
              onPressed: null,
              backgroundColor: Colors.white,
              child: Icon(Icons.search),
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}

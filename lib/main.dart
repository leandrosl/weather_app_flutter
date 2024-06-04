import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './viewmodels/city_view_model.dart';
import './screens/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CityViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}

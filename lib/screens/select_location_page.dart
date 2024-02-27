import 'package:flutter/material.dart';

class SelectLocationPage extends StatelessWidget {
  const SelectLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const TextField(
          decoration: InputDecoration(
            labelText: 'Digite uma cidade',
          ),
        ),
      ),
      body: const Column(
        children: [
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              "Belo Horizonte",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Minas Gerais, Brazil",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(
            indent: 8.0,
            endIndent: 8.0,
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              "Rio de Janeiro",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Rio de Janeiro, Brazil",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(
            indent: 8.0,
            endIndent: 8.0,
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              "Porto Alegre",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Rio Grande do Sul, Brazil",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

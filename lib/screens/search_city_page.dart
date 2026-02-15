import 'package:flutter/material.dart';

class SearchCityPage extends StatelessWidget {
  const SearchCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Pesquisar',
            filled: true,
            fillColor: Colors.grey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          cursorColor: Colors.amber,
        ),
      ),
      body: const Center(
        /*child: CircularProgressIndicator(
          color: Colors.amber,
        ),*/
        child: Text("Digite o nome da cidade desejada na campo de busca acima"),
      ),
    );
  }
}

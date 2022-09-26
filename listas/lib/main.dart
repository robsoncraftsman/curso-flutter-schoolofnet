import 'package:flutter/material.dart';

void main() => runApp(ListApp());

class ListApp extends StatelessWidget {
  ListApp({super.key});

  final List<String> veiculos = ['Carro', 'Moto', 'Caminhão'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Listas",
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Listas"),
            backgroundColor: Colors.brown,
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: veiculos.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.brown,
                    child: IconTheme(
                        data: IconThemeData(color: Colors.white),
                        child: Icon(Icons.car_repair)),
                  ),
                  title: Text(
                    veiculos[index],
                    style: const TextStyle(color: Colors.brown),
                  ),
                  subtitle: Text('Index: $index'),
                );
              })),
    );
  }
}

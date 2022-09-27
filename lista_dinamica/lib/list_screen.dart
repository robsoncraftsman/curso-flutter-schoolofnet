import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<String> veiculos = ['Carrox', 'Moto', 'Caminhão'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listas"),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) =>
              const Divider(color: Colors.brown),
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
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addItem() {
    setState(() {
      veiculos.add("Novo");
    });
  }
}

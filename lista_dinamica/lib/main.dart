import 'package:flutter/material.dart';
import 'package:lista_dinamica/list_screen.dart';

void main() => runApp(ListApp());

class ListApp extends StatelessWidget {
  const ListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Listas",
      home: ListScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lista_compras/ui/list_screen.dart';

void main() => runApp(const ListaComprasApp());

class ListaComprasApp extends StatelessWidget {
  const ListaComprasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lista de Compras',
      home: ListScreen(),
    );
  }
}

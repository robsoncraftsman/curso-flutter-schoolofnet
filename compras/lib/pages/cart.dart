import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Carrinho',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.yellow,
        ),
        body: const Center(child: Text('Carrinho de Compras')));
  }
}

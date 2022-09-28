import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Outra página',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.yellow,
        ),
        body: const Center(child: Text('Outra página')));
  }
}

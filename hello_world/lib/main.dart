import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello World',
        home: Scaffold(
            appBar: AppBar(title: Text('Hello World')),
            body: Center(child: Text('Minha primeira aplicação em Flutter'))));
  }
}

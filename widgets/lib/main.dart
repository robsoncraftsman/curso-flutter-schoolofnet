import 'package:flutter/material.dart';

void main() => runApp(const WidgetsApp());

class WidgetsApp extends StatelessWidget {
  const WidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    const TextField input = TextField();

    return MaterialApp(
        title: 'Widgets App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Widgets App'),
              centerTitle: true,
              backgroundColor: Colors.orange,
            ),
            body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  const Text('Exemplo'),
                  input,
                  const Text(
                    'Exemplo 2',
                    style: TextStyle(color: Colors.green),
                  ),
                  Row(
                    children: const [Text('01'), Text('02')],
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Button'))
                ]))));
  }
}

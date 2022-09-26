import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  int totalClicks = 0;

  void _incrementClicks() {
    setState(() {
      totalClicks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful App'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total de cliques: $totalClicks',
                  style: const TextStyle(color: Colors.green),
                ),
                ElevatedButton(
                    onPressed: _incrementClicks,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Incrementar'))
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementClicks,
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

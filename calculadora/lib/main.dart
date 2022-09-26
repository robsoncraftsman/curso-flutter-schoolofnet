import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

TextField createNumberField(final String labelValue, final onChanged) {
  String allowIntegers = r'[0-9]';

  return TextField(
    keyboardType: TextInputType.number,
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(allowIntegers)),
    ],
    style: const TextStyle(color: Colors.cyan),
    decoration: InputDecoration(
        labelText: labelValue,
        labelStyle: const TextStyle(color: Colors.cyan),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan))),
    onChanged: onChanged,
  );
}

class _MyAppState extends State<MyApp> {
  double calculatedValue = 0;
  double valorUm = 0;
  double valorDois = 0;

  void calcularResultado() {
    setState(() {
      calculatedValue = valorUm + valorDois;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextField campoUm = createNumberField(
        "Primeiro Valor", (value) => {valorUm = double.parse(value)});

    TextField campoDois = createNumberField(
        "Segundo Valor", (value) => {valorDois = double.parse(value)});

    ElevatedButton calcularButton = ElevatedButton(
        onPressed: calcularResultado,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
        child: const Text("Calcular"));

    Padding separator = const Padding(padding: EdgeInsets.all(8.0));

    Text resultText = Text('Resultado: ${calculatedValue.toStringAsFixed(0)}');

    Column column = Column(
      children: [
        campoUm,
        separator,
        campoDois,
        SizedBox(
          width: double.infinity,
          child: calcularButton,
        ),
        resultText
      ],
    );

    return MaterialApp(
        title: "Calculadora",
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Calculadora"),
              centerTitle: true,
              backgroundColor: Colors.cyan,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: column,
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:lista_compras/models/item.dart';

class AddItemDialog extends StatelessWidget {
  AddItemDialog({super.key});

  final itemFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Item'),
      content: TextField(
        autofocus: true,
        controller: itemFieldController,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar')),
        TextButton(
            onPressed: () {
              Item item = Item(itemFieldController.value.text);
              itemFieldController.clear();

              Navigator.of(context).pop(item);
            },
            child: const Text('Adicionar'))
      ],
    );
  }
}

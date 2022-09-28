import 'package:flutter/material.dart';
import 'package:lista_compras/models/item.dart';
import 'package:lista_compras/ui/add_item_dialog.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<Item> itens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Compras"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: RefreshIndicator(
          onRefresh: _refresh,
          child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.green),
              itemCount: itens.length,
              itemBuilder: (BuildContext context, index) {
                final Item item = itens[index];
                return ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: IconTheme(
                        data: const IconThemeData(color: Colors.white),
                        child: _getItemDoneIcon(item),
                      )),
                  title: Text(
                    item.title,
                    style: const TextStyle(color: Colors.green),
                  ),
                  subtitle: Text('Index: $index'),
                  onTap: () {
                    _toggleDone(item);
                  },
                );
              })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addItem() async {
    final Item? item = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AddItemDialog();
        });

    if (item != null) {
      setState(() {
        itens.add(item);
      });
    }
  }

  void _toggleDone(Item item) {
    setState(() {
      item.done = !item.done;
    });
  }

  Icon _getItemDoneIcon(Item item) {
    if (item.done) {
      return const Icon(Icons.done_all);
    } else {
      return const Icon(Icons.done);
    }
  }

  void sortItensByDone() {
    itens.sort((a, b) {
      if (a.done && !b.done) {
        return 1;
      } else if (!a.done && b.done) {
        return -1;
      } else {
        return 0;
      }
    });
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      sortItensByDone();
    });

    return Future.value();
  }
}

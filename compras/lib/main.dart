import 'package:flutter/material.dart';
import 'package:compras/pages/cart.dart';
import 'package:compras/widgets/app_bar_search.dart';
import 'package:compras/widgets/app_menu_drawer.dart';
import 'package:compras/pages/home.dart';

void main() {
  runApp(const ComprasApp());
}

class ComprasApp extends StatelessWidget {
  const ComprasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Compras', home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          child: AppMenuDrawer(),
        ),
        appBar: AppBar(
          title: const Text(
            'Compras',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.yellow,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const CartPage();
                  }));
                },
                icon: const Icon(Icons.shopping_cart)),
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: AppSearchBar());
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: const Center(
          child: Home(),
        ));
  }
}

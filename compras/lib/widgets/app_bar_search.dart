import 'package:flutter/material.dart';

class AppSearchBar extends SearchDelegate<String> {
  final products = ['TV', 'Geladeira', 'Fogão', 'Mesa', 'Sofá'];

  final recentSearchs = ['Geladeira', 'Cadeira'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            close(context, '');
          },
          icon: const Icon(Icons.cancel))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Pesquisa $query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = query.isEmpty ? recentSearchs : products;

    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.youtube_searched_for),
            title: Text(result[index]),
            onTap: () {
              print('Selecionado: ${result[index]}');
            },
          );
        });
  }
}

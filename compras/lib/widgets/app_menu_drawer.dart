import 'package:flutter/material.dart';
import 'package:compras/pages/another_page.dart';

class AppMenuDrawer extends StatelessWidget {
  const AppMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.yellow),
              child: Row(children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(color: Colors.black, width: 4.0)),
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    child: Icon(Icons.people),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Olá',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Nível Avançado')
                    ],
                  ),
                )
              ]),
            )),
        _createItem(context, Icons.home, 'Home'),
        const Divider(color: Colors.grey),
        _createItem(context, Icons.people, 'Meus dados'),
        const Divider(color: Colors.grey),
        _createItem(context, Icons.exit_to_app, 'Sair', badge: '>>')
      ],
    );
  }

  Widget _createItem(context, IconData iconData, String title,
      {String badge = '>'}) {
    return ListTile(
      leading: Icon(iconData, color: Colors.black),
      title: Text(title),
      trailing: Container(
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(100)),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
            child: Text(
              badge,
              style: const TextStyle(color: Colors.white),
            )),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const AnotherPage();
        }));
      },
    );
  }
}

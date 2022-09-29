import 'package:flutter/material.dart';
import 'package:github_user_info/ui/user_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _usernameControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.maxFinite,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60))),
          child: Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset(
                'assets/images/github.png',
                height: 120,
              )),
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              TextField(
                controller: _usernameControler,
                decoration: const InputDecoration(
                    label: Text('Username'),
                    hintText: 'Username',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0))),
              ),
              SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDetailsScreen(
                                  username: _usernameControler.value.text)));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: const Text(
                      'Mostrar Dados Usuário',
                      style: TextStyle(fontSize: 16),
                    ),
                  ))
            ])),
      ]),
    );
  }
}

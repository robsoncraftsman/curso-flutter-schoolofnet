import 'package:flutter/material.dart';
import 'package:github_user_info/models/user.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UserDetailsScreen extends StatelessWidget {
  final String username;

  const UserDetailsScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados do Usuário'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: FutureBuilder(
              future: _fetchUserDetails(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data;
                  if (user != null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            user.avatarUrl,
                            height: 100,
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        Text(
                          user.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(user.blog),
                        Container(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text('Seguidores: ${user.followers}'),
                            ),
                            Container(width: 20),
                            Container(
                              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text('Repositórios: ${user.publicRepos}'),
                            ),
                          ],
                        )
                      ],
                    );
                  } else {
                    return const Text('User not found');
                  }
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const CircularProgressIndicator(
                    backgroundColor: Colors.black,
                  );
                }
              })),
    );
  }

  Future<User> _fetchUserDetails() async {
    Uri url = Uri.https('api.github.com', '/users/$username');

    print(url.toString());
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);
      User user = User.fromJson(jsonResponse);
      print(user);
      return user;
    } else {
      throw Exception(
          'Erro ao buscar dados do usuário. Status code: ${response.statusCode}');
    }
  }
}

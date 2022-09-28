import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splash_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _checkAuth().then((_) => {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/meu_logo.png'),
          Container(height: 20),
          const CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(Colors.orange),
          ),
          Container(height: 20),
          const Text(
            'Carregando...',
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    ));
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));

    return Future.value();
  }
}

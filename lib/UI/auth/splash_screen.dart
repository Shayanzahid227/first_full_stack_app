import 'package:flutter/material.dart';
import 'package:girl_clan/UI/auth/login/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
    return Scaffold(body: Center(child: Text('Splash Screen')));
  }
}

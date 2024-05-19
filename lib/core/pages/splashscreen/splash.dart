// ignore: depend_on_referenced_packages
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterSplashScreen.fadeIn(
          duration: const Duration(seconds: 2),
          animationDuration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          onEnd: () {
            Navigator.popAndPushNamed(context, "/loginPage");
          },
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/Logo.png"),
          ),
        ),
      ),
    );
  }
}

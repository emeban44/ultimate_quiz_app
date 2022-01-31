import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/login/widgets/hig_logo.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('splash built');
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/neon_lights.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Image.asset(
              "assets/images/higlogo.png",
              height: 50,
            ),
          ),
        ));
  }
}

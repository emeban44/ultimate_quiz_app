import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/login/widgets/hig_logo.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash-screen';
  @override
  Widget build(BuildContext context) {
    print('splash built');
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
        ));
  }
}

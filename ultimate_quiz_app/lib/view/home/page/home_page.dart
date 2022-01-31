import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';
import 'package:ultimate_quiz_app/view/splash/splash_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            try {
              await authProvider.logoutUser();
            } catch (error) {
              log(error.toString());
            }
          },
          child: Icon(
            Icons.home,
            size: 100,
          ),
        ),
      ),
    );
  }
}

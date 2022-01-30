import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.lock,
        color: Colors.white,
        size: 22,
      ),
      label: const Text(
        'Forgot password?',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

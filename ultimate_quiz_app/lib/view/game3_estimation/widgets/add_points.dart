import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EstimationAddPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: const Duration(milliseconds: 8000),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: const Text(
          '+3',
          style: TextStyle(
            color: Colors.green,
            fontSize: 30,
            fontFamily: 'Acme',
          ),
        ),
      ),
    );
  }
}

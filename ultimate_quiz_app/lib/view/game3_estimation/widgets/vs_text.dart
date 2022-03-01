import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EstimationVSText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: const Duration(milliseconds: 6000),
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 0),
        child: const Text(
          'vs',
          style: TextStyle(
              fontFamily: 'Acme', fontWeight: FontWeight.w200, fontSize: 25),
        ),
      ),
    );
  }
}

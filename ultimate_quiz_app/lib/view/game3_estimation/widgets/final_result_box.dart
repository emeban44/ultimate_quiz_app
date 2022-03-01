import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EstimationFinalResultBox extends StatelessWidget {
  EstimationFinalResultBox(this.isCloser, this.result);
  final bool isCloser;
  final String result;
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: const Duration(milliseconds: 5000),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 0.5),
          gradient: LinearGradient(
              colors: isCloser
                  ? [Colors.green, Colors.green.shade900]
                  : [Colors.red, Colors.red.shade900]),
          boxShadow: [
            BoxShadow(
              color: isCloser ? Colors.green : Colors.red,
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Center(
          child: Text(
            result,
            style: const TextStyle(color: Colors.white, fontFamily: 'Acme'),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EstimationFinalResultBox extends StatelessWidget {
  EstimationFinalResultBox(this.isCloser, this.result, this.player);
  final bool isCloser;
  final int player;
  final int result;
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: Duration(milliseconds: player == 1 ? 5000 : 7000),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 40),
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
              result.toString(),
              style: const TextStyle(color: Colors.white, fontFamily: 'Acme'),
            ),
          ),
        ),
      ),
    );
  }
}

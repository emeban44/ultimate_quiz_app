import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class EstimationInputBox extends StatelessWidget {
  EstimationInputBox(this.controller);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: Duration(
          milliseconds: gameProvider.estimationPageIndex == 0 ? 4500 : 3000),
      curve: Curves.linear,
      //animationDuration: const Duration(milliseconds: 2000),
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        height: 55,
        alignment: Alignment.center,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white, width: 1),
          gradient: LinearGradient(colors: [
            Colors.blue.shade100,
            Colors.purple.shade200,
          ]),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          //textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            fontFamily: 'Lexend',
            letterSpacing: 0.75,
          ),
          //textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: '?',
            hintStyle: TextStyle(fontSize: 30, fontFamily: 'Lexend'),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(right: 0, bottom: 0.5),
            //contentPadding: const E
          ),
        ),
      ),
    );
  }
}

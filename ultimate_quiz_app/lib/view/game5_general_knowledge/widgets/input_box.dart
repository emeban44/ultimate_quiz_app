import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class GeneralKnowledgeInputBox extends StatelessWidget {
  GeneralKnowledgeInputBox(this.controller);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 1000),
      curve: Curves.easeIn,
      //animationDuration: const Duration(milliseconds: 2000),
      child: Container(
        margin: const EdgeInsets.only(top: 35, left: 20, right: 20, bottom: 10),
        height: 50,
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white, width: 1),
          gradient: LinearGradient(colors: [
            Colors.blue.shade100,
            Colors.purple.shade200,
          ]),
        ),
        child: TextFormField(
          maxLines: 1,
          controller: controller,
          textAlign: TextAlign.center,
          textCapitalization: TextCapitalization.words,
          //textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            fontFamily: 'Lexend',
            letterSpacing: 0.75,
          ),
          //textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: '?',
            counterText: '',
            hintStyle: TextStyle(fontSize: 32, fontFamily: 'Lexend'),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.only(right: 5, bottom: 4, top: 0, left: 5),
            //contentPadding: const E
          ),
        ),
      ),
    );
  }
}

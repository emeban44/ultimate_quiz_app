import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class GeneralKnowledgeConfirmButton extends StatelessWidget {
  const GeneralKnowledgeConfirmButton(this.revealTruth, this.confirmAnswer,
      {Key? key})
      : super(key: key);
  final Function(GameProvider) revealTruth;
  final Function(GameProvider) confirmAnswer;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 3000),
      //animationDuration: const Duration(milliseconds: 1000),
      curve: Curves.linear,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            //revealTruth(gameProvider);
            confirmAnswer(gameProvider);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.5),
            ),
            side: const BorderSide(color: Colors.white, width: 0.65),
          ),
          child: const Text('POTVRDI'),
        ),
      ),
    );
  }
}

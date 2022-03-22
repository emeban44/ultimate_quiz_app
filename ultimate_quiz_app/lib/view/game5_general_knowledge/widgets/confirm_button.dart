import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class GeneralKnowledgeConfirmButton extends StatelessWidget {
  const GeneralKnowledgeConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 3000),

      //animationDuration: const Duration(milliseconds: 1000),
      curve: Curves.linear,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
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

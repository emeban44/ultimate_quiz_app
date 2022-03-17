import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class GeneralKnowledgeChosenCategoryText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 0),
      offset: -0.5,
      direction: Direction.vertical,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        child: Text(
          'FILMOVI 🍿',
          style: TextStyle(
            fontFamily: 'Acme',
            letterSpacing: 0.5,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

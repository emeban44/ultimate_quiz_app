import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class GeneralKnowledgeChosenCategoryText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: const Duration(milliseconds: 0),
      animationDuration: const Duration(milliseconds: 1000),
      offset: 0.1,
      direction: Direction.vertical,
      curve: Curves.easeIn,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black38, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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

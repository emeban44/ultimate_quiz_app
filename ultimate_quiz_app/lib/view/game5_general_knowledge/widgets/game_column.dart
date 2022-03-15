import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_row.dart';

class GeneralKnowledgeGameColumn extends StatefulWidget {
  const GeneralKnowledgeGameColumn({Key? key}) : super(key: key);

  @override
  State<GeneralKnowledgeGameColumn> createState() =>
      _GeneralKnowledgeGameColumnState();
}

class _GeneralKnowledgeGameColumnState
    extends State<GeneralKnowledgeGameColumn> {
  bool isOpponentChoosingCategory = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ShowUpAnimation(
          curve: Curves.easeIn,
          direction: Direction.vertical,
          delayStart: Duration(milliseconds: 3500),
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              'PROTIVNIK BIRA:',
              style: const TextStyle(
                fontFamily: 'Acme',
                letterSpacing: 0.5,
                fontSize: 25,
              ),
            ),
          ),
        ),
        GeneralKnowledgeCategoryRow('FILMOVI 🍿', 'GEOGRAFIJA 🌍'),
        GeneralKnowledgeCategoryRow('MUZIKA 🎶', 'NAUKA 💡'),
        GeneralKnowledgeCategoryRow('HISTORIJA ⏳', 'BIOLOGIJA 🦠'),
        GeneralKnowledgeCategoryRow('SPORT 🎾', 'KNJIŽEVNOST 📖'),
        GeneralKnowledgeCategoryRow('TEHNOLOGIJA 🖥', 'UMJETNOST 🎨'),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_row.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_timer.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/chosen_category_text.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/input_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/question_box.dart';

class GeneralKnowledgeGameColumn extends StatefulWidget {
  const GeneralKnowledgeGameColumn({Key? key}) : super(key: key);

  @override
  State<GeneralKnowledgeGameColumn> createState() =>
      _GeneralKnowledgeGameColumnState();
}

class _GeneralKnowledgeGameColumnState
    extends State<GeneralKnowledgeGameColumn> {
  final TextEditingController _inputController = TextEditingController();
  bool isOpponentChoosingCategory = false;
  bool isCategorySelected = false;

  void selectCategory(GameProvider gameProvider) {
    setState(() {
      isCategorySelected = true;
    });
  }

  void confirmAnswer(GameProvider gameProvider) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isCategorySelected
          ? Column(
              children: [
                GeneralKnowledgeChosenCategoryText(),
                GeneralKnowledgeQuestionBox(),
                GeneralKnowledgeInputBox(_inputController),
                ElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5),
                    ),
                    side: BorderSide(color: Colors.white, width: 0.65),
                  ),
                  child: Text('POTVRDI'),
                ),
              ],
            )
          : Column(
              children: [
                ShowUpAnimation(
                  curve: Curves.decelerate,
                  offset: -0.5,
                  direction: Direction.vertical,
                  delayStart: Duration(milliseconds: 3000),
                  animationDuration: Duration(milliseconds: 2000),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
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
                GeneralKnowledgeCategoryRow(
                    'FILMOVI 🍿', 'GEOGRAFIJA 🌍', selectCategory),
                GeneralKnowledgeCategoryRow(
                    'MUZIKA 🎶', 'NAUKA 💡', selectCategory),
                GeneralKnowledgeCategoryRow(
                    'HISTORIJA ⏳', 'BIOLOGIJA 🦠', selectCategory),
                GeneralKnowledgeCategoryRow(
                    'SPORT 🎾', 'KNJIŽEVNOST 📖', selectCategory),
                GeneralKnowledgeCategoryRow(
                    'TEHNOLOGIJA 🖥', 'UMJETNOST 🎨', selectCategory),
                GeneralKnowledgeCategoryTimer(confirmAnswer),
              ],
            ),
    );
  }
}

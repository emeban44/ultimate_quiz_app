import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/answer_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_row.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_timer.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/chance_to_steal_points_text.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/chosen_category_text.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/confirm_button.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/input_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/question_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/question_timer.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/result_title_text.dart';

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
  bool shouldRevealTruth = false;

  void selectCategory(GameProvider gameProvider) {
    setState(() {
      isCategorySelected = true;
    });
  }

  void revealTruth(GameProvider gameProvider) {
    setState(() {
      shouldRevealTruth = true;
    });
  }

  void confirmAnswer(GameProvider gameProvider) {}

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Container(
      child: isCategorySelected
          ? Column(
              children: [
                GeneralKnowledgeChosenCategoryText(),
                GeneralKnowledgeQuestionBox(),
                if (shouldRevealTruth)
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      const GeneralKnowledgeResultTitleText('Odgovor:'),
                      GeneralKnowledgeAnswerBox(
                          'Once Upon a Time in Hollywood', false),
                      const GeneralKnowledgeResultTitleText('Tačan odgovor:'),
                      GeneralKnowledgeAnswerBox('The Revenant', true),
                      const GeneralKnowledgeResultTitleText(
                        'Prilika za napad:',
                      ),
                      GeneralKnowledgeAnswerBox('The Revenant', false),
                      ShowUpAnimation(
                        curve: Curves.easeOut,
                        animationDuration: const Duration(seconds: 1),
                        child: Container(
                          margin: const EdgeInsets.only(top: 0),
                          child: const Text(
                            '+4',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontFamily: 'Acme',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (!shouldRevealTruth)
                  GeneralKnowledgeInputBox(_inputController),
                if (!shouldRevealTruth)
                  GeneralKnowledgeConfirmButton(revealTruth),
                if (!shouldRevealTruth)
                  GeneralKnowledgeQuestionTimer(confirmAnswer),
                if (!shouldRevealTruth)
                  const GeneralKnowledgeChanceToStealPoints(),
              ],
            )
          : Column(
              children: [
                ShowUpAnimation(
                  curve: Curves.decelerate,
                  offset: -0.5,
                  direction: Direction.vertical,
                  delayStart: Duration(
                      milliseconds: gameProvider.generalKnowledgePageIndex == 0
                          ? 3500
                          : 1000),
                  animationDuration: const Duration(milliseconds: 1000),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: const Text(
                      'PROTIVNIK BIRA:',
                      style: TextStyle(
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

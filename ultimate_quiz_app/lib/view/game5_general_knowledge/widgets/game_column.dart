import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/add_points.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/answer_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_row.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/category_timer.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/chance_to_steal_points_text.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/choose_text.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/chosen_category_text.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/confirm_button.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/input_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/player_username_result.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/question_box.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/question_timer.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/result_title_text.dart';

class GeneralKnowledgeGameColumn extends StatefulWidget {
  const GeneralKnowledgeGameColumn(this.nextPage, {Key? key}) : super(key: key);
  final Function(GameProvider) nextPage;
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
  bool shouldRevealAllTruth = false;
  bool shouldRevealAttackTrue = false;
  bool didOpponentSteal = true;
  bool attackChance = true;

  void selectCategory(GameProvider gameProvider) {
    setState(() {
      isCategorySelected = true;
    });
  }

  void revealTruth(GameProvider gameProvider) {
    setState(() {
      shouldRevealTruth = true;
    });
    Future.delayed(const Duration(milliseconds: 3000))
        .then((value) => revealAllTruth(gameProvider));
  }

  void revealAllTruth(GameProvider gameProvider) {
    setState(() {
      shouldRevealAllTruth = true;
    });
    // reveal attack truth if needed
    if (gameProvider.shouldRevealAttack) {
      Future.delayed(const Duration(milliseconds: 2000))
          .then((value) => revealAttackTruthIfNeeded(gameProvider));
    } else {
      widget.nextPage(gameProvider);
    }
  }

  void revealAttackTruthIfNeeded(GameProvider gameProvider) {
    setState(() {
      shouldRevealAttackTrue = true;
    });
    widget.nextPage(gameProvider);
  }

  void confirmAnswer(GameProvider gameProvider) {
    gameProvider.game5YourAnswer = _inputController.text;
    revealTruth(gameProvider);
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Container(
      child: isCategorySelected
          ? Column(
              children: [
                const GeneralKnowledgeChosenCategoryText(),
                GeneralKnowledgeQuestionBox(),
                if (shouldRevealTruth)
                  Column(
                    children: [
                      const SizedBox(height: 5),
                      ShowUpAnimation(
                        delayStart: const Duration(milliseconds: 500),
                        curve: Curves.linear,
                        offset: 0.05,
                        child: Column(
                          children: [
                            GeneralKnowledgePlayerUsernameResult(
                                'emeban :', false),
                            GeneralKnowledgeAnswerBox(
                                answer: gameProvider.areYouChoosing == true
                                    ? gameProvider.game5YourAnswer
                                    : gameProvider.game5OpponentAnswer,
                                isCorrect: false,
                                shouldReveal: shouldRevealAllTruth),
                          ],
                        ),
                      ),
                      ShowUpAnimation(
                        delayStart: const Duration(milliseconds: 1500),
                        curve: Curves.linear,
                        offset: 0.05,
                        child: Column(
                          children: [
                            const GeneralKnowledgeResultTitleText(
                                'Tačan odgovor:'),
                            GeneralKnowledgeAnswerBox(
                                answer: gameProvider
                                    .game5SelectedQuestion!.correctAnswer!,
                                isCorrect: true,
                                shouldReveal: true),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      if (attackChance)
                        ShowUpAnimation(
                          delayStart: const Duration(milliseconds: 3500),
                          curve: Curves.linear,
                          offset: 0.05,
                          child: Column(
                            children: [
                              GeneralKnowledgePlayerUsernameResult(
                                  'drolesarajevo', true),
                              GeneralKnowledgeAnswerBox(
                                  answer: gameProvider.areYouChoosing == false
                                      ? gameProvider.game5YourAnswer
                                      : gameProvider.game5OpponentAnswer,
                                  isCorrect: true,
                                  shouldReveal: shouldRevealAttackTrue),
                            ],
                          ),
                        ),
                      GeneraldKnowledgeAddPoints(didOpponentSteal),
                    ],
                  ),
                if (!shouldRevealTruth)
                  GeneralKnowledgeInputBox(_inputController),
                if (!shouldRevealTruth)
                  GeneralKnowledgeConfirmButton(revealTruth, confirmAnswer),
                if (!shouldRevealTruth)
                  GeneralKnowledgeQuestionTimer(confirmAnswer),
                if (!shouldRevealTruth && gameProvider.areYouChoosing == false)
                  const GeneralKnowledgeChanceToStealPoints(),
              ],
            )
          : Column(
              children: [
                const GeneralKnowledgeChooseText(),
                GeneralKnowledgeCategoryRow(
                    'FILMOVI 🍿', 'GEOGRAFIJA 🌍', selectCategory),
                GeneralKnowledgeCategoryRow(
                    'MUZIKA 🎶', 'NAUKA 💡', selectCategory),
                GeneralKnowledgeCategoryRow(
                    'HISTORIJA ⌛️', 'BIOLOGIJA 🦠', selectCategory),
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

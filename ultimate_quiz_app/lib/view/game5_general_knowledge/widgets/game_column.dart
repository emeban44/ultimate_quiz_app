import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/utils/category_emojis.dart';
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
  bool didSteal = false;
  bool didOpponentSteal = false;
  bool attackChance = false;

  void selectCategory(GameProvider gameProvider) {
    setState(() {
      isCategorySelected = true;
    });
  }

  void selectRandomCategory(GameProvider gameProvider) {
    Map<String, bool> availableCategories = {};
    gameProvider.generalKnowledgeCategorySelection.forEach((key, value) {
      availableCategories.putIfAbsent(key, () => value);
    });

    availableCategories.removeWhere((key, value) => value == true);

    List<String> keys = availableCategories.keys.toList();
    int randomCategoryIndex = Random().nextInt(keys.length);

    gameProvider.generalKnowledgeCategorySelection[keys[randomCategoryIndex]] =
        true;
    gameProvider.selectedCategory = keys[randomCategoryIndex];
    gameProvider.game5SelectedQuestion = gameProvider.generalKnowledgeQuestions
        .firstWhere((element) => element.category == keys[randomCategoryIndex]);

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
    if (gameProvider.areYouChoosing &&
        !gameProvider.isGame5AnswerCorrect(gameProvider.game5YourAnswer)) {
      attackChance = true;
    }
    if (!gameProvider.areYouChoosing &&
        !gameProvider.isGame5AnswerCorrect(gameProvider.game5OpponentAnswer)) {
      attackChance = true;
    }
    setState(() {
      shouldRevealAllTruth = true;
    });
    // reveal attack truth if needed
    if (attackChance) {
      Future.delayed(const Duration(milliseconds: 1500))
          .then((value) => revealAttackTruthIfNeeded(gameProvider));
    } else {
      widget.nextPage(gameProvider);
    }
  }

  void revealAttackTruthIfNeeded(GameProvider gameProvider) {
    if (!gameProvider.isGame5AnswerCorrect(gameProvider.game5YourAnswer) &&
        gameProvider.isGame5AnswerCorrect(gameProvider.game5OpponentAnswer) &&
        gameProvider.areYouChoosing) {
      didSteal = true;
      didOpponentSteal = true;
    } else if (!gameProvider
            .isGame5AnswerCorrect(gameProvider.game5OpponentAnswer) &&
        gameProvider.isGame5AnswerCorrect(gameProvider.game5YourAnswer) &&
        !gameProvider.areYouChoosing) {
      didSteal = true;
    }
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
                                gameProvider.areYouChoosing == true
                                    ? gameProvider.yourUsername + ' :'
                                    : gameProvider.opponentUsername + ' :',
                                false),
                            GeneralKnowledgeAnswerBox(
                                answer: gameProvider.areYouChoosing == true
                                    ? gameProvider.game5YourAnswer
                                    : gameProvider.game5OpponentAnswer,
                                isCorrect: gameProvider.isGame5AnswerCorrect(
                                    gameProvider.areYouChoosing == true
                                        ? gameProvider.game5YourAnswer
                                        : gameProvider.game5OpponentAnswer),
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
                                'Ta??an odgovor:'),
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
                          delayStart: const Duration(milliseconds: 0),
                          curve: Curves.linear,
                          offset: 0.05,
                          child: Column(
                            children: [
                              GeneralKnowledgePlayerUsernameResult(
                                  gameProvider.areYouChoosing == false
                                      ? gameProvider.yourUsername + ' :'
                                      : gameProvider.opponentUsername + ' :',
                                  true),
                              GeneralKnowledgeAnswerBox(
                                  answer: gameProvider.areYouChoosing == false
                                      ? gameProvider.game5YourAnswer
                                      : gameProvider.game5OpponentAnswer,
                                  isCorrect: gameProvider.isGame5AnswerCorrect(
                                      gameProvider.areYouChoosing == false
                                          ? gameProvider.game5YourAnswer
                                          : gameProvider.game5OpponentAnswer),
                                  shouldReveal: shouldRevealAttackTrue),
                            ],
                          ),
                        ),
                      if (attackChance && didOpponentSteal)
                        GeneraldKnowledgeAddPoints(didOpponentSteal)
                      else if (shouldRevealTruth &&
                          gameProvider.isGame5AnswerCorrect(
                              gameProvider.game5OpponentAnswer) &&
                          !gameProvider.areYouChoosing)
                        const GeneraldKnowledgeAddPoints(
                          false,
                          didOpponentWinRegular: true,
                        )
                      else if (shouldRevealTruth &&
                          gameProvider.isGame5AnswerCorrect(
                              gameProvider.game5YourAnswer) &&
                          gameProvider.areYouChoosing)
                        const GeneraldKnowledgeAddPoints(false)
                      else if (shouldRevealTruth &&
                          gameProvider.isGame5AnswerCorrect(
                              gameProvider.game5YourAnswer) &&
                          !gameProvider.isGame5AnswerCorrect(
                              gameProvider.game5OpponentAnswer) &&
                          !gameProvider.areYouChoosing)
                        const GeneraldKnowledgeAddPoints(
                          false,
                          didYouSteal: true,
                        ),
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
                    'filmovi', 'geografija', selectCategory),
                GeneralKnowledgeCategoryRow('muzika', 'nauka', selectCategory),
                GeneralKnowledgeCategoryRow(
                    'historija', 'biologija', selectCategory),
                GeneralKnowledgeCategoryRow(
                    'sport', 'knji??evnost', selectCategory),
                GeneralKnowledgeCategoryRow(
                    'tehnologija', 'umjetnost', selectCategory),
                GeneralKnowledgeCategoryTimer(selectRandomCategory),
              ],
            ),
    );
  }
}

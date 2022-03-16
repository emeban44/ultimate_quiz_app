import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/add_point.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/all_correct_bonus_column.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/answer_box.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/correct_answer_box.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/final_result_box.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/question_box.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/reorderable_answers_list.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/result_row.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/wrong_answer.dart';

import 'bottom_timer.dart';
import 'confirm_button.dart';

class SortByGameColumn extends StatefulWidget {
  const SortByGameColumn(this.nextView, {Key? key}) : super(key: key);
  final Function(GameProvider) nextView;
  @override
  State<SortByGameColumn> createState() => _SortByGameColumnState();
}

class _SortByGameColumnState extends State<SortByGameColumn> {
  bool shouldReveal = false;

  void confirmAnswer(GameProvider gameProvider) {
    gameProvider.sortyByGameTimer?.cancel();
    calculateHomePlayerPoints(gameProvider);
    setState(() {
      shouldReveal = true;
    });
    if (gameProvider.sortByPageIndex < 2) {
      widget.nextView(gameProvider);
    }
  }

  void calculateHomePlayerPoints(GameProvider gameProvider) {
    for (int i = 0;
        i <
            gameProvider.sortByQuestions[gameProvider.sortByPageIndex]
                .correctList.length;
        i++) {
      if (gameProvider
              .sortByQuestions[gameProvider.sortByPageIndex].correctList[i] ==
          gameProvider
              .sortByQuestions[gameProvider.sortByPageIndex].shuffledList[i]) {
        gameProvider.correctSorts++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final int currentPage = gameProvider.sortByPageIndex;
    return Expanded(
      child: Column(
        children: [
          SortByQuestionBox(
              gameProvider.sortByQuestions[currentPage].question!),
          if (shouldReveal)
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShowUpAnimation(
                      offset: 0.1,
                      //delayStart: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          // color: Colors.black26,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Rješenje:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Signika', fontSize: 26),
                        ),
                      ),
                    ),
                    SortByResultRow(
                      orderedResult: '1. ' +
                          gameProvider
                              .sortByQuestions[currentPage].correctList[0],
                      homePlayerCorrectAnswer: gameProvider
                                  .sortByQuestions[currentPage]
                                  .correctList[0] ==
                              gameProvider
                                  .sortByQuestions[currentPage].shuffledList[0]
                          ? true
                          : false,
                      awayPlayerCorrectAnswer: false,
                      order: 1,
                    ),
                    SortByResultRow(
                      orderedResult: '2. ' +
                          gameProvider
                              .sortByQuestions[currentPage].correctList[1],
                      homePlayerCorrectAnswer: gameProvider
                                  .sortByQuestions[currentPage]
                                  .correctList[1] ==
                              gameProvider
                                  .sortByQuestions[currentPage].shuffledList[1]
                          ? true
                          : false,
                      awayPlayerCorrectAnswer: false,
                      order: 2,
                    ),
                    SortByResultRow(
                      orderedResult: '3. ' +
                          gameProvider
                              .sortByQuestions[currentPage].correctList[2],
                      homePlayerCorrectAnswer: gameProvider
                                  .sortByQuestions[currentPage]
                                  .correctList[2] ==
                              gameProvider
                                  .sortByQuestions[currentPage].shuffledList[2]
                          ? true
                          : false,
                      awayPlayerCorrectAnswer: false,
                      order: 3,
                    ),
                    SortByResultRow(
                      orderedResult: '4. ' +
                          gameProvider
                              .sortByQuestions[currentPage].correctList[3],
                      homePlayerCorrectAnswer: gameProvider
                                  .sortByQuestions[currentPage]
                                  .correctList[3] ==
                              gameProvider
                                  .sortByQuestions[currentPage].shuffledList[3]
                          ? true
                          : false,
                      awayPlayerCorrectAnswer: false,
                      order: 4,
                    ),
                    SortByResultRow(
                      orderedResult: '5. ' +
                          gameProvider
                              .sortByQuestions[currentPage].correctList[4],
                      homePlayerCorrectAnswer: gameProvider
                                  .sortByQuestions[currentPage]
                                  .correctList[4] ==
                              gameProvider
                                  .sortByQuestions[currentPage].shuffledList[4]
                          ? true
                          : false,
                      awayPlayerCorrectAnswer: false,
                      order: 5,
                    ),
                    ShowUpAnimation(
                      delayStart: const Duration(milliseconds: 10050),
                      animationDuration: const Duration(seconds: 1),
                      curve: Curves.decelerate,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SortByAllCorrectBonusColumn(
                                gameProvider.correctSorts == 5 ? true : false),
                            SortByFinalResultBox(),
                            SortByAllCorrectBonusColumn(false),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (!shouldReveal) SortByReorderableAnswerList(),
          if (!shouldReveal)
            Flexible(
              flex: 1,
              child: ShowUpAnimation(
                delayStart: Duration(
                    milliseconds:
                        gameProvider.sortByPageIndex == 0 ? 5200 : 2600),
                animationDuration: const Duration(seconds: 1),
                curve: Curves.linear,
                offset: 0.1,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SortByConfirmButton(confirmAnswer),
                    SortByBottomTimer(confirmAnswer),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

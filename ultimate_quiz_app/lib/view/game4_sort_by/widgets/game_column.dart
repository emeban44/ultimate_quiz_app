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
    setState(() {
      shouldReveal = true;
    });
    if (gameProvider.sortByPageIndex < 1) {
      widget.nextView(gameProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Expanded(
      child: Column(
        children: [
          SortByQuestionBox('Poredaj tenisere po broju Grand Slam titula:'),
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
                          color: Colors.black26,
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
                      orderedResult: '1. Rafael Nadal',
                      homePlayerCorrectAnswer: true,
                      awayPlayerCorrectAnswer: false,
                      order: 1,
                    ),
                    SortByResultRow(
                      orderedResult: '2. Novak Đoković',
                      homePlayerCorrectAnswer: true,
                      awayPlayerCorrectAnswer: false,
                      order: 2,
                    ),
                    SortByResultRow(
                      orderedResult: '3. Andy Murray',
                      homePlayerCorrectAnswer: true,
                      awayPlayerCorrectAnswer: false,
                      order: 3,
                    ),
                    SortByResultRow(
                      orderedResult: '4. Marin Čilić',
                      homePlayerCorrectAnswer: true,
                      awayPlayerCorrectAnswer: false,
                      order: 4,
                    ),
                    SortByResultRow(
                      orderedResult: '5. Damir Džumhur',
                      homePlayerCorrectAnswer: true,
                      awayPlayerCorrectAnswer: true,
                      order: 5,
                    ),
                    ShowUpAnimation(
                      delayStart: const Duration(milliseconds: 10050),
                      animationDuration: const Duration(seconds: 1),
                      curve: Curves.decelerate,
                      child: Container(
                        margin: const EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SortByAllCorrectBonusColumn(true),
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
                        gameProvider.sortByPageIndex == 0 ? 5200 : 3600),
                animationDuration: const Duration(seconds: 1),
                curve: Curves.linear,
                offset: 0.1,
                child: Container(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SortByConfirmButton(confirmAnswer),
                      SortByBottomTimer(confirmAnswer),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

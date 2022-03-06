import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/answer_box.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/correct_answer_box.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/question_box.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/reorderable_answers_list.dart';

import 'bottom_timer.dart';
import 'confirm_button.dart';

class SortByGameColumn extends StatefulWidget {
  const SortByGameColumn({Key? key}) : super(key: key);

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
            ShowUpAnimation(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          const Text(
                            'Ti:',
                            style: TextStyle(fontFamily: 'Acme'),
                          ),
                          SortByAnswerBox('1. Novak Đoković'),
                          SortByAnswerBox('2. Andy Murray'),
                          SortByAnswerBox('3. Rafael Nadal'),
                          SortByAnswerBox('4. Marin Čilić'),
                          SortByAnswerBox('5. Damir Džumhur'),
                        ],
                      ),
                    ),
                    Container(
                      //margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          const Text(
                            'Protivnik:',
                            style: TextStyle(fontFamily: 'Acme'),
                          ),
                          SortByAnswerBox('1. Novak Đoković'),
                          SortByAnswerBox('2. Andy Murray'),
                          SortByAnswerBox('3. Rafael Nadal'),
                          SortByAnswerBox('4. Marin Čilić'),
                          SortByAnswerBox('5. Damir Džumhur'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (shouldReveal)
            ShowUpAnimation(
                child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Rješenje:',
                      style: TextStyle(fontFamily: 'Signika'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SortByCorrectAnswerBox('1. Rafael Nadal'),
                  SortByCorrectAnswerBox('2. Novak Đoković'),
                  SortByCorrectAnswerBox('3. Andy Murray'),
                  SortByCorrectAnswerBox('4. Marin Čilić'),
                  SortByCorrectAnswerBox('5. Damir Džumhur'),
                ],
              ),
            )),
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
                      SortByBottomTimer(),
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

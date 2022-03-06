import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Expanded(
      child: Column(
        children: [
          SortByQuestionBox('Poredaj tenisere po broju Grand Slam titula:'),
          SortByReorderableAnswerList(),
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
                    SortByConfirmButton(),
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

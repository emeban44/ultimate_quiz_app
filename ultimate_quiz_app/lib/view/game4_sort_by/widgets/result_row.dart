import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'add_point.dart';
import 'correct_answer_box.dart';
import 'wrong_answer.dart';

class SortByResultRow extends StatelessWidget {
  SortByResultRow({
    required this.orderedResult,
    required this.homePlayerCorrectAnswer,
    required this.awayPlayerCorrectAnswer,
    required this.order,
  });
  final String orderedResult;
  final bool homePlayerCorrectAnswer;
  final bool awayPlayerCorrectAnswer;
  final int order;
  @override
  Widget build(BuildContext context) {
    return //ShowUpAnimation(
        // curve: Curves.easeIn,
        // delayStart: Duration(
        //     milliseconds: order == 1
        //         ? 2000
        //         : order == 2
        //             ? 3000
        //             : order == 3
        //                 ? 4000
        //                 : order == 4
        //                     ? 5000
        //                     : order == 5
        //                         ? 6000
        //                         : 7000),
        Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (homePlayerCorrectAnswer) SortByAddPoint() else SortByWrongAnswer(),
        // else
        //   SortByWrongAnswer(),
        Expanded(child: SortByCorrectAnswerBox(orderedResult)),
        if (awayPlayerCorrectAnswer) SortByAddPoint() else SortByWrongAnswer(),
        // ShowUpAnimation(
        //   curve: Curves.easeIn,
        //   delayStart: Duration(
        //       milliseconds: order == 1
        //           ? 3000
        //           : order == 2
        //               ? 4000
        //               : order == 3
        //                   ? 5000
        //                   : order == 4
        //                       ? 6000
        //                       : order == 5
        //                           ? 7000
        //                           : 8000),
        //   child:
        //       awayPlayerCorrectAnswer ? SortByAddPoint() : SortByWrongAnswer(),
        // ),
      ],
    );
    //);
  }
}

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowUpAnimation(
          curve: Curves.easeIn,
          delayStart: Duration(
              milliseconds: order == 1
                  ? 1400
                  : order == 2
                      ? 3200
                      : order == 3
                          ? 5000
                          : order == 4
                              ? 6800
                              : order == 5
                                  ? 8600
                                  : 7000),
          child:
              homePlayerCorrectAnswer ? SortByAddPoint() : SortByWrongAnswer(),
        ),
        Expanded(
          child: ShowUpAnimation(
            curve: Curves.easeIn,
            delayStart: Duration(
                milliseconds: order == 1
                    ? 800
                    : order == 2
                        ? 2600
                        : order == 3
                            ? 4400
                            : order == 4
                                ? 6200
                                : order == 5
                                    ? 8000
                                    : 7000),
            child: SortByCorrectAnswerBox(orderedResult),
          ),
        ),
        ShowUpAnimation(
          curve: Curves.easeIn,
          delayStart: Duration(
              milliseconds: order == 1
                  ? 2000
                  : order == 2
                      ? 3800
                      : order == 3
                          ? 5600
                          : order == 4
                              ? 7400
                              : order == 5
                                  ? 9200
                                  : 7000),
          child:
              awayPlayerCorrectAnswer ? SortByAddPoint() : SortByWrongAnswer(),
        )
        // if (awayPlayerCorrectAnswer)
        //   ShowUpAnimation(
        //     curve: Curves.easeIn,
        //     delayStart: Duration(
        //         milliseconds: order == 1
        //             ? 2000
        //             : order == 2
        //                 ? 4000
        //                 : order == 3
        //                     ? 6000
        //                     : order == 4
        //                         ? 8000
        //                         : order == 5
        //                             ? 10000
        //                             : 7000),
        //     child: SortByAddPoint(),
        //   )
        // else
        //   ShowUpAnimation(
        //     curve: Curves.easeIn,
        //     delayStart: Duration(
        //         milliseconds: order == 1
        //             ? 2000
        //             : order == 2
        //                 ? 4000
        //                 : order == 3
        //                     ? 6000
        //                     : order == 4
        //                         ? 8000
        //                         : order == 5
        //                             ? 10000
        //                             : 7000),
        //     child: SortByWrongAnswer(),
        //   ),
      ],
    );
  }
}

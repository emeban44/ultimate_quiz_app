import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/add_points.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/answer_box.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/answer_row.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/confirm_button.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/correct_answer_box.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/correct_answer_text.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/final_result_box.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/result_text.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/vs_text.dart';

class EstimationBottomTimer extends StatefulWidget {
  EstimationBottomTimer({
    required this.confirmAnswer,
    required this.didConfirm,
    required this.controller,
    this.correctAnswer,
    this.opponentAnswer,
    this.opponentDifference,
    this.yourAnswer,
    this.yourDifference,
    this.homePlayerWon,
  });
  final Function(GameProvider) confirmAnswer;
  final bool didConfirm;
  final TextEditingController controller;
  final int? correctAnswer;
  final int? yourAnswer;
  final int? opponentAnswer;
  final int? yourDifference;
  final int? opponentDifference;
  final bool? homePlayerWon;
  // EstimationBottomTimer(this.revealEverything, this.shouldRevealEverything);
  // final Function() revealEverything;
  // final bool shouldRevealEverything;
  @override
  State<EstimationBottomTimer> createState() => _EstimationBottomTimerState();
}

class _EstimationBottomTimerState extends State<EstimationBottomTimer> {
  int countdown = 10;
  int percentCounter = 0;
  bool shouldRevealTruth = false;
  //bool didConfirm = false;
  Timer? _timer;

  void startTimer(GameProvider gameProvider) {
    gameProvider.estimationGameTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdown--;
        if (percentCounter < 10) {
          percentCounter++;
        }
        if (countdown == 0 || timer.tick == 11) {
          timer.cancel();
          shouldRevealTruth = true;
          //widget.revealEverything();
          gameProvider.game3ShouldDisableSelection = true;
        }
      });
    });
    _timer = gameProvider.estimationGameTimer;
    gameProvider.game3ShouldDisableSelection = false;
  }

  @override
  void initState() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    Future.delayed(Duration(
            milliseconds: gameProvider.estimationPageIndex == 0 ? 6000 : 4500))
        .whenComplete(() => startTimer(gameProvider));
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final int currentPage = gameProvider.estimationPageIndex;
    return //widget.shouldRevealEverything
        // shouldRevealTruth
        //     ?
        widget.didConfirm
            ? Column(
                children: [
                  EstimationAnswerRow(
                      widget.yourAnswer!, widget.opponentAnswer!),
                  EstimationCorrectAnswerText(),
                  EstimationCorrectAnswerBox(widget.correctAnswer!),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Column(
                      children: [
                        EstimationResultText(),
                        Container(
                          margin: const EdgeInsets.only(top: 17.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              EstimationFinalResultBox(widget.homePlayerWon!,
                                  widget.yourDifference!, 1),
                              EstimationVSText(),
                              EstimationFinalResultBox(!widget.homePlayerWon!,
                                  widget.opponentDifference!, 2),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  if (widget.homePlayerWon!) EstimationAddPoints(),
                ],
              )
            : Column(
                children: [
                  if (!widget.didConfirm)
                    ShowUpAnimation(
                      delayStart: Duration(
                          milliseconds: gameProvider.estimationPageIndex == 0
                              ? 5500
                              : 4000),
                      curve: Curves.linear,
                      child: EstimationConfirmButton(widget.confirmAnswer),
                    ),
                  if (!widget.didConfirm)
                    ShowUpAnimation(
                      delayStart: Duration(
                          milliseconds: gameProvider.estimationPageIndex == 0
                              ? 5500
                              : 4000),
                      curve: Curves.linear,
                      child: Container(
                        margin: const EdgeInsets.only(top: 60, bottom: 10),
                        child: CircularPercentIndicator(
                          radius: 50,
                          progressColor: Colors.pink.shade900,
                          backgroundColor: Colors.transparent,
                          lineWidth: 3,
                          percent: 1 - percentCounter * 0.1,
                          center: Text(
                            countdown.toString(),
                            style: const TextStyle(
                              fontFamily: 'Acme',
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
  }
}

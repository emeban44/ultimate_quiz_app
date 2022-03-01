import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/confirm_button.dart';

class EstimationBottomTimer extends StatefulWidget {
  EstimationBottomTimer(this.confirmAnswer, this.didConfirm);
  final Function confirmAnswer;
  final bool didConfirm;
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
        Timer.periodic(Duration(seconds: 1), (timer) {
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
    // Future.delayed(Duration(
    //         milliseconds: gameProvider.estimationPageIndex == 0 ? 6000 : 4500))
    //     .whenComplete(() => startTimer(gameProvider));
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
    final int currentPage = gameProvider.guessingPageIndex;
    return //widget.shouldRevealEverything

        shouldRevealTruth
            ? Container(
                margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
                alignment: Alignment.center,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // if (gameProvider
                    //         .estimationQuestions[currentPage].correctAnswer ==
                    //     gameProvider.game2SelectedAnswer)
                    ShowUpAnimation(
                      curve: Curves.easeOut,
                      animationDuration: const Duration(seconds: 1),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          '+1',
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
              )
            : widget.didConfirm
                ? Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 15),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ShowUpAnimation(
                                      curve: Curves.easeOut,
                                      animationDuration:
                                          const Duration(seconds: 1),
                                      delayStart:
                                          const Duration(milliseconds: 0),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 12.5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.black38,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Ti:',
                                              style: TextStyle(
                                                fontFamily: 'Signika',
                                                fontSize: 22,
                                                //fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                '50',
                                                style: TextStyle(
                                                    fontFamily: 'Acme'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ShowUpAnimation(
                                      curve: Curves.easeOut,
                                      animationDuration:
                                          const Duration(seconds: 1),
                                      delayStart:
                                          const Duration(milliseconds: 1000),
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(top: 12.5),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.black38,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Protivnik:',
                                              style: TextStyle(
                                                fontFamily: 'Signika',
                                                fontSize: 22,
                                                //fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                '59',
                                                style: TextStyle(
                                                    fontFamily: 'Acme'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        ShowUpAnimation(
                          curve: Curves.easeOut,
                          animationDuration: const Duration(seconds: 1),
                          delayStart: const Duration(milliseconds: 2000),
                          child: Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: const Text(
                              'Tačan odgovor:',
                              style: TextStyle(
                                fontFamily: 'Signika',
                                fontSize: 22,
                                //fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        ShowUpAnimation(
                          curve: Curves.easeOut,
                          animationDuration: const Duration(seconds: 1),
                          delayStart: const Duration(milliseconds: 3000),
                          child: Container(
                            margin: const EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7.5, vertical: 3.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.white, width: 0.4),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blue,
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  )
                                ],
                                gradient: LinearGradient(colors: [
                                  Colors.blue.shade900,
                                  Colors.pink.shade900,
                                ])
                                //color: Colors.green,
                                ),
                            child: Text(
                              '84',
                              style: const TextStyle(fontFamily: 'Acme'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          child: Column(
                            children: [
                              ShowUpAnimation(
                                curve: Curves.easeOut,
                                animationDuration: const Duration(seconds: 1),
                                delayStart: const Duration(milliseconds: 4000),
                                child: Text(
                                  'Rezultat:',
                                  style: TextStyle(
                                    fontFamily: 'Signika',
                                    fontSize: 22,
                                    //fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 17.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ShowUpAnimation(
                                      curve: Curves.easeOut,
                                      animationDuration:
                                          const Duration(seconds: 1),
                                      delayStart:
                                          const Duration(milliseconds: 5000),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7.5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.white, width: 0.5),
                                          gradient: LinearGradient(colors: [
                                            Colors.red,
                                            Colors.red.shade900
                                          ]),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.red,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                            )
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            '34',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Acme'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ShowUpAnimation(
                                      curve: Curves.easeOut,
                                      animationDuration:
                                          const Duration(seconds: 1),
                                      delayStart:
                                          const Duration(milliseconds: 6000),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 15, right: 15, top: 0),
                                        child: Text(
                                          'vs',
                                          style: TextStyle(
                                              fontFamily: 'Acme',
                                              fontWeight: FontWeight.w200,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                    ShowUpAnimation(
                                      curve: Curves.easeOut,
                                      animationDuration:
                                          const Duration(seconds: 1),
                                      delayStart:
                                          const Duration(milliseconds: 7000),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7.5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.white, width: 0.5),
                                          gradient: LinearGradient(colors: [
                                            Colors.green,
                                            Colors.green.shade900
                                          ]),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.green,
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                            )
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            '25',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Acme'),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ShowUpAnimation(
                          curve: Curves.easeOut,
                          animationDuration: const Duration(seconds: 1),
                          delayStart: const Duration(milliseconds: 8000),
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text(
                              '+3',
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
                  )
                : Column(
                    children: [
                      if (!widget.didConfirm)
                        ShowUpAnimation(
                          delayStart: Duration(
                              milliseconds:
                                  gameProvider.estimationPageIndex == 0
                                      ? 5500
                                      : 4000),
                          curve: Curves.linear,
                          child: EstimationConfirmButton(widget.confirmAnswer),
                        ),
                      if (!widget.didConfirm)
                        ShowUpAnimation(
                          delayStart: Duration(
                              milliseconds:
                                  gameProvider.estimationPageIndex == 0
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

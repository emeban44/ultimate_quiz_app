import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/bottom_timer.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/input_box.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/widgets/question_box.dart';

class EstimationGameView extends StatefulWidget {
  EstimationGameView({
    required this.pageController,
  });
  final PageController pageController;

  @override
  _EstimationGameViewState createState() => _EstimationGameViewState();
}

class _EstimationGameViewState extends State<EstimationGameView> {
  bool didConfirm = false;
  double? correctAnswer;
  double? yourAnswer;
  double? opponentAnswer;
  double? yourDifference;
  double? opponentDifference;
  bool? homePlayerWon;
  bool bothPlayersWon = false;
  bool homePlayerInvalidInput = false;
  bool awayPlayerInvalidInput = false;
  final TextEditingController _inputController = TextEditingController();

  void nextView(GameProvider gameProvider) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      widget.pageController.nextPage(
          duration: Duration(
              milliseconds:
                  gameProvider.estimationPageIndex == 4 ? 1800 : 1000),
          curve: gameProvider.estimationPageIndex == 4
              ? Curves.easeInToLinear
              : Curves.easeIn);
      gameProvider.incrementEstimationIndex();
      gameProvider.game3ResetSelection();
    });
  }

  void confirmAnswer(GameProvider gameProvider) {
    calculateFinalResult(gameProvider);
    setState(() {
      didConfirm = !didConfirm;
    });
    gameProvider.estimationGameTimer?.cancel();
    if (gameProvider.estimationPageIndex < 5) {
      Future.delayed(const Duration(milliseconds: 4500))
          .whenComplete(() => nextView(gameProvider));
    }
  }

  void calculateFinalResult(GameProvider gameProvider) {
    correctAnswer = double.parse(gameProvider
        .estimationQuestions[gameProvider.estimationPageIndex].correctAnswer!);
    if (_inputController.text.isEmpty) {
      yourAnswer = -123456789.0;
      homePlayerInvalidInput = true;
    } else {
      yourAnswer = double.tryParse(_inputController.text.replaceAll(',', '.'));
      if (yourAnswer == null) {
        homePlayerInvalidInput = true;
        yourAnswer ??= -123456789.0;
      } else if (_inputController.text.contains('.') ||
          _inputController.text.contains(',')) {
        gameProvider.estimationQuestions[gameProvider.estimationPageIndex]
            .isDecimal = true;
      }
    }
    opponentAnswer = double.tryParse('200.99');
    if (opponentAnswer == null) {
      awayPlayerInvalidInput = true;
      opponentAnswer ??= -123456789.0;
    }
    yourDifference = (correctAnswer! - yourAnswer!).abs();
    opponentDifference = (correctAnswer! - opponentAnswer!).abs();
    if (yourDifference! < opponentDifference!) {
      homePlayerWon = true;
    } else if (yourDifference == opponentDifference) {
      bothPlayersWon = true;
      homePlayerWon = true;
    } else {
      homePlayerWon = false;
    }
    if (homePlayerInvalidInput) {
      yourDifference = -123456789.0;
    }
    if (awayPlayerInvalidInput) {
      opponentDifference = -123456789.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            if (gameProvider.estimationPageIndex == 0)
              GestureDetector(
                //onTap: () => nextView(gameProvider),
                child: ShowUpAnimation(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 15, right: 25, left: 25),
                    child: Image.asset('assets/images/ko_je_blizi_fit.png'),
                  ),
                  delayStart: const Duration(milliseconds: 1200),
                  animationDuration: const Duration(seconds: 3),
                  curve: Curves.decelerate,
                  direction: Direction.vertical,
                ),
              )
            else
              GestureDetector(
                //onTap: () => nextView(),
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 15, right: 25, left: 25),
                  child: Image.asset('assets/images/ko_je_blizi_fit.png'),
                ),
              ),
            EstimationQuestionBox(),
            if (!didConfirm) EstimationInputBox(_inputController),
            Column(
              children: [
                EstimationBottomTimer(
                  confirmAnswer: confirmAnswer,
                  homePlayerWon: homePlayerWon,
                  bothPlayersWon: bothPlayersWon,
                  didConfirm: didConfirm,
                  controller: _inputController,
                  correctAnswer: correctAnswer,
                  opponentAnswer: opponentAnswer,
                  opponentDifference: opponentDifference,
                  yourAnswer: yourAnswer,
                  homePlayerInvalidInput: homePlayerInvalidInput,
                  awayPlayerInvalidInput: awayPlayerInvalidInput,
                  yourDifference: yourDifference,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

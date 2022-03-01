import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/answer_column.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/firebase_image.dart';
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
  int? correctAnswer;
  int? yourAnswer;
  int? opponentAnswer;
  int? yourDifference;
  int? opponentDifference;
  bool? homePlayerWon;
  final TextEditingController _inputController = TextEditingController();
  void nextView(GameProvider gameProvider) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      widget.pageController
          .nextPage(duration: const Duration(seconds: 2), curve: Curves.easeIn);
      gameProvider.incrementEstimationIndex();
      gameProvider.game3ResetSelection();
    });
  }

  void confirmAnswer(GameProvider gameProvider) {
    calculateFinalResult();
    setState(() {
      didConfirm = !didConfirm;
    });
    gameProvider.estimationGameTimer?.cancel();
  }

  void calculateFinalResult() {
    correctAnswer = int.parse('83');
    yourAnswer = int.parse(_inputController.text);
    opponentAnswer = int.parse('59');
    yourDifference = (correctAnswer! - yourAnswer!).abs();
    opponentDifference = (correctAnswer! - opponentAnswer!).abs();
    if (yourDifference! < opponentDifference!) {
      homePlayerWon = true;
    } else {
      homePlayerWon = false;
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
                onTap: () => nextView(gameProvider),
                child: ShowUpAnimation(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 15, right: 25, left: 25),
                    child: Image.asset('assets/images/ko_je_blizi_fit.png'),
                  ),
                  delayStart: const Duration(milliseconds: 1250),
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
                  didConfirm: didConfirm,
                  controller: _inputController,
                  correctAnswer: correctAnswer,
                  opponentAnswer: opponentAnswer,
                  opponentDifference: opponentDifference,
                  yourAnswer: yourAnswer,
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

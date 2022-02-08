import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/models/odd_one_out_question.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

import 'answer_box.dart';

class OddOneOutAnswerColumn extends StatefulWidget {
  OddOneOutAnswerColumn({
    required this.shouldRevealAnwers,
  });
  final bool shouldRevealAnwers;
  @override
  State<OddOneOutAnswerColumn> createState() => _OddOneOutAnswerColumnState();
}

class _OddOneOutAnswerColumnState extends State<OddOneOutAnswerColumn> {
  final List<bool> _answerSelection = [false, false, false, false];
  //final List<bool> _answerTruth = [false, false, false, true];

  bool isFirstGame = false;

  void _selectAnswer(int index) {
    if (_answerSelection[index] == false) {
      setState(() {
        for (int i = 0; i < _answerSelection.length; i++) {
          _answerSelection[i] = false;
        }
        _answerSelection[index] = true;
      });
    }
  }

  void firstGamePlayed() {
    setState(() {
      isFirstGame = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final int currentPage = gameProvider.oddOneOutPageIndex;
    final List<OddOneOutQuestion> questions = gameProvider.oddOneOutQuestions;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ShowUpAnimation(
            delayStart: Duration(
                milliseconds:
                    gameProvider.oddOneOutPageIndex != 0 ? 750 : 2700),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: OddOneOutAnswerBox(
              isSelected: _answerSelection[0],
              correctAnswer: questions[currentPage].correctAnswer!,
              index: 0,
              shouldRevealTruth: widget.shouldRevealAnwers,
              answer: questions[currentPage].answers[0],
              //theTruth: _answerTruth,
              selectAnswer: _selectAnswer,
            ),
          ),
          ShowUpAnimation(
            delayStart: Duration(
                milliseconds:
                    gameProvider.oddOneOutPageIndex != 0 ? 1800 : 3700),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: OddOneOutAnswerBox(
              answer: questions[currentPage].answers[1],
              correctAnswer: questions[currentPage].correctAnswer!,
              isSelected: _answerSelection[1],
              index: 1,
              shouldRevealTruth: widget.shouldRevealAnwers,
              //theTruth: _answerTruth,
              selectAnswer: _selectAnswer,
            ),
          ),
          ShowUpAnimation(
            delayStart: Duration(
                milliseconds:
                    gameProvider.oddOneOutPageIndex != 0 ? 2750 : 4700),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: OddOneOutAnswerBox(
              index: 2,
              correctAnswer: questions[currentPage].correctAnswer!,
              answer: questions[currentPage].answers[2],
              isSelected: _answerSelection[2],
              selectAnswer: _selectAnswer,
              shouldRevealTruth: widget.shouldRevealAnwers,
            ),
          ),
          ShowUpAnimation(
            delayStart: Duration(
                milliseconds:
                    gameProvider.oddOneOutPageIndex != 0 ? 3900 : 5700),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: OddOneOutAnswerBox(
              shouldRevealTruth: widget.shouldRevealAnwers,
              answer: questions[currentPage].answers[3],
              correctAnswer: questions[currentPage].correctAnswer!,
              isSelected: _answerSelection[3],
              index: 3,
              selectAnswer: _selectAnswer,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/answer_row.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/bottom_timer.dart';

class GuessingAnswerColumn extends StatefulWidget {
  GuessingAnswerColumn(this.gameProvider, this.nextPage);
  final GameProvider gameProvider;
  final Function(GameProvider) nextPage;

  @override
  State<GuessingAnswerColumn> createState() => _GuessingAnswerColumnState();
}

class _GuessingAnswerColumnState extends State<GuessingAnswerColumn> {
  final List<bool> _answerSelection = [false, false, false, false];

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

  bool shouldRevealAnswers = false;

  void revealAnswers() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    setState(() {
      shouldRevealAnswers = true;
      print('revealAnswers');
    });
    //gameProvider.incrementOddOneOutIndex();
    if (gameProvider.guessingPageIndex < 3) {
      widget.nextPage(gameProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(children: [
        ShowUpAnimation(
          delayStart: Duration(
              milliseconds:
                  widget.gameProvider.guessingPageIndex == 0 ? 3500 : 3000),
          curve: Curves.easeIn,
          //animationDuration: ,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Pogodi ličnost sa slike:',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Signika',
                fontSize: 21,
              ),
            ),
          ),
        ),
        ShowUpAnimation(
          delayStart: Duration(
              milliseconds:
                  widget.gameProvider.guessingPageIndex == 0 ? 4500 : 4000),
          curve: Curves.easeIn,
          child: GuessingAnswerRow(
            answer1: 'Gavrilo Princip',
            answer2: 'Nikola Tesla',
            index1: 0,
            index2: 1,
            selectAnswer: _selectAnswer,
            selection: _answerSelection,
            correctAnswer: 0,
            revealEverything: revealAnswers,
            shouldRevealTruth: shouldRevealAnswers,
          ),
        ),
        ShowUpAnimation(
          delayStart: Duration(
              milliseconds:
                  widget.gameProvider.guessingPageIndex == 0 ? 5500 : 5000),
          curve: Curves.easeIn,
          child: GuessingAnswerRow(
            answer1: 'Edin Džeko',
            answer2: 'Matthew McConaughey',
            index1: 2,
            index2: 3,
            selectAnswer: _selectAnswer,
            selection: _answerSelection,
            correctAnswer: 0,
            revealEverything: revealAnswers,
            shouldRevealTruth: shouldRevealAnswers,
          ),
        ),
        ShowUpAnimation(
          delayStart: Duration(
              milliseconds:
                  widget.gameProvider.guessingPageIndex == 0 ? 6500 : 6000),
          curve: Curves.easeIn,
          child: GuessingBottomTimer(revealAnswers, shouldRevealAnswers),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
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
  final List<bool> _answerTruth = [false, false, false, true];

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

  final List<String> _potentialAnswers = [
    'Novak Đokovič',
    'Daniil Medvedev',
    'Damir Džumhur',
    'Nikola Jokić', // Nikola Jokić nije teniser.
  ];
  final List<String> _potentialAnswers1 = [
    'Amper',
    'Volt', // Volt nije osnovna mjerna jedinica.
    'Kilogram',
    'Metar',
  ];
  final List<String> _potentialAnswers2 = [
    'Se7en',
    'Mr. & Mrs. Smith',
    'The Matrix', // U filmu Matrix nije glumio Brad Pitt.
    'Fight Club',
  ];
  final List<String> _potentialAnswers3 = [
    'Windows',
    'macOS',
    'Linux',
    'HDMI', // HDMI nije operativni sistem. To je kabal.
  ];
  final List<String> _potentialAnswers4 = [
    'Pantera',
    'Hijena', // Hijena ne pripada rodu mačaka.
    'Leopard',
    'Gepard',
  ];

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    final int currentPage = gameProvider.oddOneOutPageIndex;
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
              answer: currentPage == 0
                  ? _potentialAnswers[0]
                  : currentPage == 1
                      ? _potentialAnswers1[0]
                      : currentPage == 2
                          ? _potentialAnswers2[0]
                          : currentPage == 3
                              ? _potentialAnswers3[0]
                              : _potentialAnswers4[0],
              isSelected: _answerSelection[0],
              index: 0,
              shouldRevealTruth: widget.shouldRevealAnwers,
              theTruth: _answerTruth,
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
              answer: currentPage == 0
                  ? _potentialAnswers[1]
                  : currentPage == 1
                      ? _potentialAnswers1[1]
                      : currentPage == 2
                          ? _potentialAnswers2[1]
                          : currentPage == 3
                              ? _potentialAnswers3[1]
                              : _potentialAnswers4[1],
              isSelected: _answerSelection[1],
              index: 1,
              shouldRevealTruth: widget.shouldRevealAnwers,
              theTruth: _answerTruth,
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
              theTruth: _answerTruth,
              answer: currentPage == 0
                  ? _potentialAnswers[2]
                  : currentPage == 1
                      ? _potentialAnswers1[2]
                      : currentPage == 2
                          ? _potentialAnswers2[2]
                          : currentPage == 3
                              ? _potentialAnswers3[2]
                              : _potentialAnswers4[2],
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
              answer: currentPage == 0
                  ? _potentialAnswers[3]
                  : currentPage == 1
                      ? _potentialAnswers1[3]
                      : currentPage == 2
                          ? _potentialAnswers2[3]
                          : currentPage == 3
                              ? _potentialAnswers3[3]
                              : _potentialAnswers4[3],
              theTruth: _answerTruth,
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

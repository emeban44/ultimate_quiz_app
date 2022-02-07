import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'answer_box.dart';

class OddOneOutAnswerColumn extends StatefulWidget {
  @override
  State<OddOneOutAnswerColumn> createState() => _OddOneOutAnswerColumnState();
}

class _OddOneOutAnswerColumnState extends State<OddOneOutAnswerColumn> {
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

  final List<String> _potentialAnswers = [
    'Novak Đokovič',
    'Roger Federer',
    'Damir Džumhur',
    'Ante Žižić',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ShowUpAnimation(
            delayStart: const Duration(milliseconds: 1000),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: OddOneOutAnswerBox(
              answer: _potentialAnswers[0],
              isSelected: _answerSelection[0],
              index: 0,
              selectAnswer: _selectAnswer,
            ),
          ),
          ShowUpAnimation(
            delayStart: const Duration(milliseconds: 2000),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: OddOneOutAnswerBox(
              answer: _potentialAnswers[1],
              isSelected: _answerSelection[1],
              index: 1,
              selectAnswer: _selectAnswer,
            ),
          ),
          ShowUpAnimation(
            delayStart: const Duration(milliseconds: 3000),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: OddOneOutAnswerBox(
              index: 2,
              answer: _potentialAnswers[2],
              isSelected: _answerSelection[2],
              selectAnswer: _selectAnswer,
            ),
          ),
          ShowUpAnimation(
            delayStart: const Duration(milliseconds: 4000),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: OddOneOutAnswerBox(
              answer: _potentialAnswers[3],
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

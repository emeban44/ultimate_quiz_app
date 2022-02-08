import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class OddOneOutAnswerBox extends StatefulWidget {
  OddOneOutAnswerBox({
    required this.answer,
    required this.isSelected,
    required this.selectAnswer,
    required this.index,
    required this.correctAnswer,
    //required this.theTruth,
    required this.shouldRevealTruth,
  });
  final String answer;
  final bool isSelected;
  final Function(int) selectAnswer;
  final int index;
  final int correctAnswer;
  //final List<bool> theTruth;
  final bool shouldRevealTruth;

  @override
  State<OddOneOutAnswerBox> createState() => _OddOneOutAnswerBoxState();
}

class _OddOneOutAnswerBoxState extends State<OddOneOutAnswerBox> {
  Color revealColor() {
    if (widget.shouldRevealTruth) {
      if (widget.index == widget.correctAnswer) {
        return Colors.green;
      }
      if (widget.isSelected && widget.correctAnswer != widget.index) {
        return Colors.redAccent.shade700;
      }
    } else {
      if (widget.isSelected) {
        return Colors.black87;
      }
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        if (gameProvider.game1ShouldDisableSelection == false) {
          widget.selectAnswer(widget.index);
          gameProvider.game1SelectedAnswer = widget.index;
        }
      },
      child: Container(
        alignment: Alignment.center,
        //height: 55,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: revealColor() == Colors.transparent ? null : revealColor(),
          gradient: widget.shouldRevealTruth && widget.isSelected
              ? null
              : widget.index == widget.correctAnswer && widget.shouldRevealTruth
                  ? null
                  : widget.isSelected
                      ? null
                      : LinearGradient(colors: [
                          Colors.blue.shade900.withOpacity(0.5),
                          Colors.purple.shade900.withOpacity(0.5),
                          Colors.pink.shade900.withOpacity(0.5),
                        ]),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Text(
          widget.answer,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Signika',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

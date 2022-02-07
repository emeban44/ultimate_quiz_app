import 'package:flutter/material.dart';

class OddOneOutAnswerBox extends StatefulWidget {
  OddOneOutAnswerBox({
    required this.answer,
    required this.isSelected,
    required this.selectAnswer,
    required this.index,
    required this.theTruth,
    required this.shouldRevealTruth,
  });
  final String answer;
  final bool isSelected;
  final Function(int) selectAnswer;
  final int index;
  final List<bool> theTruth;
  final bool shouldRevealTruth;

  @override
  State<OddOneOutAnswerBox> createState() => _OddOneOutAnswerBoxState();
}

class _OddOneOutAnswerBoxState extends State<OddOneOutAnswerBox> {
  Color revealColor() {
    if (widget.shouldRevealTruth) {
      if (widget.theTruth[widget.index] == true) {
        return Colors.green;
      }
      if (widget.isSelected && widget.theTruth[widget.index] == false) {
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
    return GestureDetector(
      onTap: () {
        widget.selectAnswer(widget.index);
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
              : widget.theTruth[widget.index] && widget.shouldRevealTruth
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

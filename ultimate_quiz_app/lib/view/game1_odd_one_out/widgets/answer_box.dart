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
    required this.revealEverything,
  });
  final String answer;
  final bool isSelected;
  final Function(int) selectAnswer;
  final int index;
  final int correctAnswer;
  //final List<bool> theTruth;
  final bool shouldRevealTruth;
  final Function() revealEverything;

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
    return Container(
      // alignment: Alignment.center,
      //height: 55,
      width: double.infinity,

      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: revealColor() == Colors.transparent ? null : revealColor(),
        gradient: widget.shouldRevealTruth && widget.isSelected
            ? null
            : widget.index == widget.correctAnswer && widget.shouldRevealTruth
                ? null
                : widget.isSelected
                    ? LinearGradient(colors: [
                        Colors.blue.shade900.withOpacity(1),
                        Colors.purple.shade900.withOpacity(1),
                        Colors.pink.shade900.withOpacity(1),
                      ])
                    : const LinearGradient(colors: [
                        Colors.black45,
                        Colors.black54,
                      ]),
        // ? null
        // : LinearGradient(colors: [
        //     Colors.blue.shade900.withOpacity(0.5),
        //     Colors.purple.shade900.withOpacity(0.5),
        //     Colors.pink.shade900.withOpacity(0.5),
        //   ]),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: GestureDetector(
        // child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     primary: Colors.transparent,
        //     elevation: 0,
        //     onPrimary: Colors.white,
        //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //   ),
        //   onPressed: () {
        onTap: () {
          if (gameProvider.game1ShouldDisableSelection == false) {
            widget.selectAnswer(widget.index);
            gameProvider.game1SelectedAnswer = widget.index;
            gameProvider.oddOneOutTimer!.cancel();
            gameProvider.game1ShouldDisableSelection = true;
            widget.revealEverything();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.answer,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Sarala',
              fontSize: 19,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OddOneOutAnswerBox extends StatefulWidget {
  OddOneOutAnswerBox({
    required this.answer,
    required this.isSelected,
    required this.selectAnswer,
    required this.index,
  });
  final String answer;
  final bool isSelected;
  final Function(int) selectAnswer;
  final int index;

  @override
  State<OddOneOutAnswerBox> createState() => _OddOneOutAnswerBoxState();
}

class _OddOneOutAnswerBoxState extends State<OddOneOutAnswerBox> {
  // bool isPressed = false;

  // void onAnswerPressed() {
  //   setState(() {
  //     isPressed = !isPressed;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.selectAnswer(widget.index);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected
              ? Colors.black87
              : null, //Colors.redAccent.shade700 : null,
          gradient: widget.isSelected
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
          style: TextStyle(
            fontFamily: 'Signika',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

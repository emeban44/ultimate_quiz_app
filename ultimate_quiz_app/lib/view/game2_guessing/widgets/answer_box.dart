import 'package:flutter/material.dart';

class GuessingAnswerBox extends StatelessWidget {
  GuessingAnswerBox(
    this.text,
    this.index,
    this.isSelected,
    this.selectAnswer,
  );
  final String text;
  final int index;
  final bool isSelected;
  final Function(int) selectAnswer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        //width: double.infinity,
        margin: const EdgeInsets.only(right: 5, left: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(15),
          gradient: isSelected
              ? LinearGradient(colors: [
                  Colors.blue.shade900.withOpacity(0.9),
                  Colors.purple.shade900.withOpacity(0.9),
                  Colors.pink.shade900.withOpacity(0.9),
                ])
              : LinearGradient(colors: [
                  Colors.black12,
                  Colors.black12,
                ]),
        ),
        child: ElevatedButton(
          onPressed: () => selectAnswer(index),
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              // minimumSize: Size(50, 20),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
          child: FittedBox(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Sarala',
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

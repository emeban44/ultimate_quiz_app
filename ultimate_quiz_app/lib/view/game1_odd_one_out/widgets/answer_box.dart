import 'package:flutter/material.dart';

class OddOneOutAnswerBox extends StatefulWidget {
  OddOneOutAnswerBox(this.text);
  final String text;

  @override
  State<OddOneOutAnswerBox> createState() => _OddOneOutAnswerBoxState();
}

class _OddOneOutAnswerBoxState extends State<OddOneOutAnswerBox> {
  bool isPressed = false;

  void onAnswerPressed() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onAnswerPressed();
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 12.5, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isPressed
              ? Colors.black87
              : null, //Colors.redAccent.shade700 : null,
          gradient: isPressed
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
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Signika'),
        ),
      ),
    );
  }
}

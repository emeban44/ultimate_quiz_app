import 'package:flutter/material.dart';

class SortByCorrectAnswerBox extends StatelessWidget {
  const SortByCorrectAnswerBox(this.answer, {Key? key}) : super(key: key);
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 15),
      //width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 2,
            color: Colors.blue,
          )
        ],
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.pink.shade900],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: 200, maxHeight: 25, minHeight: 25, minWidth: 100),
          child: Container(
            // width: 200,
            // height: 25,
            child: FittedBox(
              child: Text(
                answer,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Signika', fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

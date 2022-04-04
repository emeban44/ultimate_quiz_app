import 'package:flutter/material.dart';

class GeneralKnowledgeAnswerBox extends StatelessWidget {
  const GeneralKnowledgeAnswerBox(
      {required this.answer,
      required this.isCorrect,
      required this.shouldReveal,
      Key? key})
      : super(key: key);
  final String answer;
  final bool isCorrect;
  final bool shouldReveal;
  @override
  Widget build(BuildContext context) {
    print(answer);
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 70,
          maxHeight: 65,
          minHeight: 65),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7.5),
        margin: const EdgeInsets.only(top: 12.5, bottom: 10),
        decoration: shouldReveal && isCorrect
            ? BoxDecoration(
                //color: Colors.black,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.green,
                    spreadRadius: 2,
                    blurRadius: 5,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade400,
                    Colors.green.shade700,
                  ],
                ),
              )
            : shouldReveal && !isCorrect
                ? BoxDecoration(
                    //color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white),
                    gradient: LinearGradient(
                      colors: [
                        Colors.redAccent.shade700,
                        Colors.redAccent.shade400,
                      ],
                    ),
                  )
                : BoxDecoration(
                    //color: Colors.black,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 0.6),
                    gradient: const LinearGradient(
                      colors: [Colors.black26, Colors.black38],
                    ),
                  ),
        child: FittedBox(
          child: Text(
            answer.isEmpty ? ' - ' : answer,
            style: const TextStyle(
              fontFamily: 'Signika',
              fontSize: 23,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GeneralKnowledgeAnswerBox extends StatelessWidget {
  const GeneralKnowledgeAnswerBox(this.answer, this.isCorrect, {Key? key})
      : super(key: key);
  final String answer;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 70,
          maxHeight: 68,
          minHeight: 68),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7.5),
        margin: const EdgeInsets.only(top: 12.5, bottom: 10),
        decoration: isCorrect
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
                    Colors.green.shade900,
                  ],
                ),
              )
            : BoxDecoration(
                //color: Colors.black,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,
                    blurRadius: 5,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white),
                gradient: LinearGradient(
                  colors: [
                    Colors.black26,
                    Colors.black38,
                  ],
                ),
              ),
        child: FittedBox(
          child: Text(
            answer,
            style: const TextStyle(fontFamily: 'Signika', fontSize: 23),
          ),
        ),
      ),
    );
  }
}

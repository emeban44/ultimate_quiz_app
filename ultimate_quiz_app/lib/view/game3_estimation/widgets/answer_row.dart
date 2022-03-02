import 'package:flutter/material.dart';

import 'answer_box.dart';

class EstimationAnswerRow extends StatelessWidget {
  EstimationAnswerRow(this.yourAnswer, this.opponentAnswer);
  final double yourAnswer;
  final double opponentAnswer;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EstimationAnswerBox('Ti:', yourAnswer),
                  EstimationAnswerBox('Protivnik:', opponentAnswer),
                ],
              )),
        ),
      ],
    );
  }
}

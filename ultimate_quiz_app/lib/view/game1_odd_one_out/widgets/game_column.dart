import 'package:flutter/material.dart';

import 'answer_column.dart';
import 'bottom_timer_widget.dart';

class OddOneOutGameColumn extends StatefulWidget {
  OddOneOutGameColumn(this.nextPage);
  final Function nextPage;
  @override
  _OddOneOutGameColumnState createState() => _OddOneOutGameColumnState();
}

class _OddOneOutGameColumnState extends State<OddOneOutGameColumn> {
  bool shouldRevealAnswers = false;
  void revealAnswers() {
    print('REVEAL');
    setState(() {
      shouldRevealAnswers = true;
    });
    widget.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          OddOneOutAnswerColumn(shouldRevealAnwers: shouldRevealAnswers),
          BottomTimer(revealAnswers),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

import 'answer_column.dart';
import 'bottom_timer_widget.dart';

class OddOneOutGameColumn extends StatefulWidget {
  OddOneOutGameColumn(this.nextPage);
  final Function(GameProvider) nextPage;
  @override
  _OddOneOutGameColumnState createState() => _OddOneOutGameColumnState();
}

class _OddOneOutGameColumnState extends State<OddOneOutGameColumn> {
  bool shouldRevealAnswers = false;
  void revealAnswers() {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    setState(() {
      shouldRevealAnswers = true;
      print('revealAnswers');
    });
    //gameProvider.incrementOddOneOutIndex();
    if (gameProvider.oddOneOutPageIndex < 5) {
      widget.nextPage(gameProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Flexible(
      child: Column(
        children: [
          OddOneOutAnswerColumn(
              shouldRevealAnwers: shouldRevealAnswers,
              revealEverything: revealAnswers),
          BottomTimer(revealAnswers, shouldRevealAnswers),
        ],
      ),
    );
  }
}

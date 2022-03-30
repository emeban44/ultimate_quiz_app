import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class GeneraldKnowledgeAddPoints extends StatelessWidget {
  const GeneraldKnowledgeAddPoints(this.didOpponentSteal, {Key? key})
      : super(key: key);
  final bool didOpponentSteal;
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      curve: Curves.easeOut,
      delayStart: Duration(milliseconds: didOpponentSteal ? 6500 : 3500),
      child: Container(
        margin: const EdgeInsets.only(top: 0),
        child: Text(
          didOpponentSteal ? 'Protivnik +4' : '+4',
          style: TextStyle(
            color: Colors.greenAccent.shade700,
            fontSize: 25,
            fontFamily: 'Acme',
          ),
        ),
      ),
    );
  }
}

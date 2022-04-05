import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class GeneraldKnowledgeAddPoints extends StatelessWidget {
  const GeneraldKnowledgeAddPoints(this.didOpponentSteal,
      {Key? key, this.didYouSteal})
      : super(key: key);

  final bool didOpponentSteal;
  final bool? didYouSteal;

  @override
  Widget build(BuildContext context) {
    return didYouSteal != null
        ? ShowUpAnimation(
            curve: Curves.easeOut,
            delayStart: Duration(milliseconds: 5000),
            child: Container(
              margin: const EdgeInsets.only(top: 0),
              child: Text(
                '+4',
                style: TextStyle(
                  color: Colors.greenAccent.shade700,
                  fontSize: 25,
                  fontFamily: 'Acme',
                ),
              ),
            ),
          )
        : ShowUpAnimation(
            curve: Curves.easeOut,
            delayStart: Duration(milliseconds: didOpponentSteal ? 0 : 3000),
            child: Container(
              margin: const EdgeInsets.only(top: 0),
              child: Text(
                didOpponentSteal ? 'Protivnik +4' : '+3',
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

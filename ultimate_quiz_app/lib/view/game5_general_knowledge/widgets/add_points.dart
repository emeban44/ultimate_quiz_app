import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class GeneraldKnowledgeAddPoints extends StatelessWidget {
  const GeneraldKnowledgeAddPoints(
    this.didOpponentSteal, {
    Key? key,
    this.didYouSteal,
    this.didOpponentWinRegular,
  }) : super(key: key);

  final bool didOpponentSteal;
  final bool? didYouSteal;
  final bool? didOpponentWinRegular;

  @override
  Widget build(BuildContext context) {
    return didOpponentWinRegular != null
        ? ShowUpAnimation(
            curve: Curves.easeOut,
            delayStart: const Duration(milliseconds: 3000),
            child: Container(
              margin: const EdgeInsets.only(top: 0),
              child: Text(
                'Protivnik +3',
                style: TextStyle(
                  color: Colors.red.shade900,
                  fontSize: 23,
                  fontFamily: 'Acme',
                ),
              ),
            ),
          )
        : didYouSteal != null
            ? ShowUpAnimation(
                curve: Curves.easeOut,
                delayStart: const Duration(milliseconds: 5000),
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
                      color: didOpponentSteal
                          ? Colors.red.shade900
                          : Colors.greenAccent.shade700,
                      fontSize: didOpponentSteal ? 23 : 25,
                      fontFamily: 'Acme',
                    ),
                  ),
                ),
              );
  }
}

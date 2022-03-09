import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class SortByAllCorrectBonusColumn extends StatelessWidget {
  SortByAllCorrectBonusColumn(this.shouldAddBonus);
  final bool shouldAddBonus;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Container(
      width: 45,
      padding: const EdgeInsets.symmetric(),
      decoration: BoxDecoration(
          color: gameProvider.correctSorts == 5 ? Colors.black54 : null,
          borderRadius: BorderRadius.circular(5),
          boxShadow: shouldAddBonus
              ? [
                  BoxShadow(
                    color: Colors.greenAccent.shade400.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ]
              : null,
          border: shouldAddBonus
              ? Border.all(color: Colors.greenAccent.shade400, width: 0.1)
              : null),
      child: shouldAddBonus
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '5/5',
                  style: TextStyle(
                      fontFamily: 'Acme',
                      color: Colors.greenAccent.shade400,
                      fontSize: 25),
                ),
                Text(
                  '+2',
                  style: TextStyle(
                      fontFamily: 'Acme',
                      color: Colors.greenAccent.shade400,
                      fontSize: 25),
                ),
                Text(
                  'BONUS',
                  style: TextStyle(
                      fontFamily: 'Acme',
                      color: Colors.greenAccent.shade400,
                      fontSize: 10),
                ),
              ],
            )
          : SizedBox(
              width: 45,
              child: gameProvider.correctSorts == 0 ? const Text('🤡') : null,
            ),
    );
  }
}

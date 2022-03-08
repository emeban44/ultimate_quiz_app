import 'package:flutter/material.dart';

class SortByAllCorrectBonusColumn extends StatelessWidget {
  SortByAllCorrectBonusColumn(this.shouldAddBonus);
  final bool shouldAddBonus;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
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
          : const SizedBox(
              width: 40,
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class SortByFinalResultBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Container(
      //width: 150,
      margin: const EdgeInsets.only(top: 0),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            'Rezultat:',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Signika',
              fontSize: 24,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                gameProvider.correctSorts == 5
                    ? '${gameProvider.correctSorts + 2} : 0'
                    : '${gameProvider.correctSorts} : 0',
                style: const TextStyle(
                    fontFamily: 'Acme', fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

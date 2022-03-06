import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class SortByConfirmButton extends StatelessWidget {
  const SortByConfirmButton(this.confirmAnswer, {Key? key}) : super(key: key);
  final Function(GameProvider) confirmAnswer;
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => confirmAnswer(gameProvider),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: const Text(
          'POTVRDI',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

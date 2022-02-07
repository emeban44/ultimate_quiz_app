import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class PressStartButton extends StatelessWidget {
  PressStartButton({
    required this.isHomePlayerReady,
    required this.onPress,
    required this.shouldShowOpponent,
    required this.countdownNumber,
  });
  final bool isHomePlayerReady;
  final bool shouldShowOpponent;
  final Function onPress;
  final int countdownNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.5,
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: 155, // double.infinity,
      decoration: shouldShowOpponent
          ? BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black87,
            )
          : isHomePlayerReady
              ? BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.green.shade600,
                    Colors.green.shade800,
                  ]),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white))
              : BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black87,
                ),
      child: ElevatedButton(
        onPressed: () {
          final GameProvider gameProvider =
              Provider.of<GameProvider>(context, listen: false);
          gameProvider.resetCounters();
          onPress();
          // onOpponentReady();

          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return CountdownDialog();
          //     });
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: isHomePlayerReady && !shouldShowOpponent
            ? const Icon(Icons.check, size: 32)
            : Text(
                shouldShowOpponent
                    ? '$countdownNumber'
                    : isHomePlayerReady
                        ? 'READY'
                        : 'START',
                style: const TextStyle(fontSize: 25, fontFamily: 'Acme'),
              ),
      ),
    );
  }
}

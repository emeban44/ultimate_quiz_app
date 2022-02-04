import 'package:flutter/material.dart';

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
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      width: double.infinity,
      decoration: isHomePlayerReady
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
            ),
      child: ElevatedButton(
        onPressed: () {
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
            ? const Icon(Icons.check)
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

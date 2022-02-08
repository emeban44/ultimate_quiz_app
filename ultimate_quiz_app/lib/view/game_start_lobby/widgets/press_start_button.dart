import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class PressStartButton extends StatefulWidget {
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
  State<PressStartButton> createState() => _PressStartButtonState();
}

class _PressStartButtonState extends State<PressStartButton> {
  bool didPressOnce = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.5,
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: 155, // double.infinity,
      decoration: widget.shouldShowOpponent
          ? BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black87,
            )
          : widget.isHomePlayerReady
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
          if (didPressOnce == false) {
            final GameProvider gameProvider =
                Provider.of<GameProvider>(context, listen: false);
            gameProvider.resetCounters();
            widget.onPress();
            setState(() {
              didPressOnce = true;
            });
          }
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: widget.isHomePlayerReady && !widget.shouldShowOpponent
            ? const Icon(Icons.check, size: 32)
            : Text(
                widget.shouldShowOpponent
                    ? '${widget.countdownNumber}'
                    : widget.isHomePlayerReady
                        ? 'READY'
                        : 'START',
                style: const TextStyle(fontSize: 25, fontFamily: 'Acme'),
              ),
      ),
    );
  }
}

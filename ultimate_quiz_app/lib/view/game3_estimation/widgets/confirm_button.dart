import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class EstimationConfirmButton extends StatefulWidget {
  EstimationConfirmButton(this.confirmAnswer);
  final Function(GameProvider) confirmAnswer;
  @override
  State<EstimationConfirmButton> createState() =>
      _EstimationConfirmButtonState();
}

class _EstimationConfirmButtonState extends State<EstimationConfirmButton> {
  bool isClicked = false;

  void toggleClicked(GameProvider gameProvider) {
    setState(() {
      isClicked = !isClicked;
    });
    widget.confirmAnswer(gameProvider);
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 10),

      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.white, width: 1.0)),
      child: isClicked
          ? GestureDetector(
              //onTap: () => toggleClicked(gameProvider),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.check,
                  size: 35,
                ),
              ),
            )
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.black,
                  side: BorderSide(color: Colors.white, width: 0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5))),
              // primary: Colors.black,
              // onSurface: Colors.white,
              // textStyle: TextStyle(color: Colors.white)),
              onPressed: () => toggleClicked(gameProvider),
              child: Text(
                'POTVRDI',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}

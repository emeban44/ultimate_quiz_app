import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  PlayButton(this.title, this.onPress);
  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white, width: 1),
        gradient: LinearGradient(
          colors: [
            Colors.pink.shade900,
            Colors.purple.shade500,
            Colors.blue.shade600,
          ],
        ),
      ),
      height: 70,
      width: 250,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {
            onPress();
          },
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Acme',
              letterSpacing: 0.75,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          )),
    );
  }
}

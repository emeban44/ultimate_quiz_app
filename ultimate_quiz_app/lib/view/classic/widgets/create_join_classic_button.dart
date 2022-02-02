import 'package:flutter/material.dart';

class CreateJoinClassicButton extends StatelessWidget {
  CreateJoinClassicButton(this.title, this.onPress);
  final String title;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.5, right: 30, left: 30),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.5,
            fontFamily: 'Sarala',
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  PlayButton(this.title);
  final String title;
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
            Colors.blue.shade400,
          ],
        ),
      ),
      height: 70,
      width: 200,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Acme',
              letterSpacing: 0.75,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
    );
  }
}

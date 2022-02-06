import 'package:flutter/material.dart';

class PlayerScoreBox extends StatelessWidget {
  PlayerScoreBox({
    required this.imageURL,
    required this.isHomePlayer,
    required this.score,
    required this.username,
  });
  final String imageURL;
  final String username;
  final bool isHomePlayer;
  final int score;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
        gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.pink.shade900]),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: null,
                radius: 30,
                backgroundImage: NetworkImage(imageURL),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 7.5),
                child: Text(
                  score.toString(),
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Acme',
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: const Divider(
              color: Colors.white,
              height: 1,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3.5),
            child: Text(
              username,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Acme',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

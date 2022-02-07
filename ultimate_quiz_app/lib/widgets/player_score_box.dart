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
        gradient: isHomePlayer
            ? LinearGradient(colors: [
                Colors.blue.shade900.withOpacity(0.75),
                Colors.pink.shade900.withOpacity(0.75),
              ])
            : LinearGradient(colors: [
                Colors.pink.shade900.withOpacity(0.75),
                Colors.blue.shade900.withOpacity(0.75),
              ]),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              if (!isHomePlayer)
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 5),
                  child: Text(
                    score.toString(),
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Acme',
                    ),
                  ),
                ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: CircleAvatar(
                  child: null,
                  radius: 25,
                  backgroundImage: NetworkImage(imageURL),
                ),
              ),
              if (isHomePlayer)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Text(
                    score.toString(),
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Acme',
                    ),
                  ),
                ),
            ],
          ),
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          //   color: Colors.white,
          //   height: 1,
          //   width: 100,
          //   //child: Text('x'),
          // ),
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

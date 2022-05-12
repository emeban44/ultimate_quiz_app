import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlayerScoreBox extends StatelessWidget {
  const PlayerScoreBox({
    Key? key,
    required this.imageURL,
    required this.isHomePlayer,
    required this.score,
    required this.username,
  }) : super(key: key);
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
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: isHomePlayer ? Colors.blue.shade900 : Colors.pink.shade900,
            spreadRadius: 3,
            blurRadius: 5,
          )
        ],
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
                  padding: const EdgeInsets.only(right: 10.0, top: 2.5),
                  child: Text(
                    score.toString(),
                    style: const TextStyle(
                      fontSize: 35,
                      fontFamily: 'Acme',
                      shadows: <Shadow>[
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2.5,
                          offset: Offset(1.5, 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 2,
                      offset: Offset(1.5, 1.5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: CircleAvatar(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: CachedNetworkImage(
                        imageUrl: imageURL,
                        fit: BoxFit.cover,
                        errorWidget: (context, value, error) => Image.asset('assets/images/home_center_play.jpg'),
                        filterQuality: FilterQuality.high,
                        placeholder: (context, url) => Image.asset('assets/images/home_center_play.jpg'),
                      ),
                    ),
                  ),
                  radius: 23,
                  backgroundColor: Colors.black,
                  // backgroundImage: CachedNetworkImageProvider(
                  //   imageURL,
                  // ),
                ),
              ),
              if (isHomePlayer)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 2.5),
                  child: Text(
                    score.toString(),
                    style: const TextStyle(
                      fontSize: 35,
                      fontFamily: 'Acme',
                      shadows: <Shadow>[
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2.5,
                          offset: Offset(1.5, 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 3.5),
            child: Text(
              username,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Acme',
                shadows: <Shadow>[
                  Shadow(
                    color: Colors.black,
                    blurRadius: 2.5,
                    offset: Offset(1, 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

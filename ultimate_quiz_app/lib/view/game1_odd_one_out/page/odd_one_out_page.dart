import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/widgets/answer_box.dart';
import 'package:ultimate_quiz_app/widgets/player_score_box.dart';

class OddOneOutPage extends StatelessWidget {
  static const String routeName = '/odd-one-out-page';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 1,
          image: AssetImage("assets/images/neon_smoke_light.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.black54,
          body: Container(
            padding: const EdgeInsets.only(top: 75, left: 25, right: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlayerScoreBox(
                        imageURL:
                            'https://d19p4plxg0u3gz.cloudfront.net/22485164-82a1-11ec-9502-3a30aa7aa275/original.jpeg',
                        isHomePlayer: true,
                        score: 0,
                        username: '@bradpitt'),
                    Text(
                      'vs',
                      style: TextStyle(fontFamily: 'Acme'),
                    ),
                    PlayerScoreBox(
                        imageURL:
                            'https://celebrity.fm/wp-content/uploads/2021/08/What-is-Tom-Cruise-worth-29-732x549.jpg',
                        isHomePlayer: false,
                        score: 0,
                        username: '@tomcruise'),
                  ],
                ),
                FittedBox(
                  child: Container(
                    //width: 300,
                    height: 125,
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/images/game_banner.png'),
                        Text(
                          'IZBACI ULJEZA',
                          style: TextStyle(
                            fontFamily: 'Retrolight',
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    OddOneOutAnswerBox('Novak Đokovič'),
                    OddOneOutAnswerBox('Roger Federer'),
                    OddOneOutAnswerBox('Damir Džumhur'),
                    OddOneOutAnswerBox('Ante Žižić'),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

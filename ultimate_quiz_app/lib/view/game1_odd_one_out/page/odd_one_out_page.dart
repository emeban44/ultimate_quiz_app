import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/widgets/answer_box.dart';
import 'package:ultimate_quiz_app/widgets/player_score_box.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:show_up_animation/show_up_animation.dart';

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
          padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
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
                  const Text(
                    'vs',
                    style: TextStyle(fontFamily: 'Acme'),
                  ),
                  PlayerScoreBox(
                      imageURL:
                          'https://celebrity.fm/wp-content/uploads/2021/08/What-is-Tom-Cruise-worth-29-732x549.jpg',
                      isHomePlayer: false,
                      score: 25,
                      username: '@tomcruise'),
                ],
              ),
              ShowUpAnimation(
                child: Container(
                  // height: 125,
                  margin: const EdgeInsets.only(top: 15, bottom: 30),
                  // width: 300,
                  child: Image.asset('assets/images/izbaci_uljeza_fit.png'),
                ),
                delayStart: const Duration(milliseconds: 20),
                animationDuration: const Duration(seconds: 1),
              ),
              Column(
                children: [
                  ShowUpAnimation(
                    delayStart: const Duration(milliseconds: 1000),
                    animationDuration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: OddOneOutAnswerBox('Novak Đokovič'),
                  ),
                  ShowUpAnimation(
                    delayStart: const Duration(milliseconds: 2000),
                    animationDuration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: OddOneOutAnswerBox('Roger Federer'),
                  ),
                  ShowUpAnimation(
                    delayStart: const Duration(milliseconds: 3000),
                    animationDuration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: OddOneOutAnswerBox('Damir Džumhur'),
                  ),
                  ShowUpAnimation(
                    delayStart: const Duration(milliseconds: 4000),
                    animationDuration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                    child: OddOneOutAnswerBox('Ante Žižić'),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '15', //'( Jedan od ponuđenih nije teniser )',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/page/odd_one_out_game_view.dart';
import 'package:ultimate_quiz_app/widgets/player_score_box.dart';

class OddOneOutPage extends StatelessWidget {
  static const String routeName = '/odd-one-out-page';
  final PageController _pageController = PageController();

  void nextPage(GameProvider gameProvider) {
    Future.delayed(
      const Duration(milliseconds: 4500),
    ).whenComplete(() {
      _pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
      );
      gameProvider.incrementOddOneOutIndex();
    });
  }

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
          //padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 25, right: 25, top: 60, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PlayerScoreBox(
                        imageURL:
                            'https://d19p4plxg0u3gz.cloudfront.net/22485164-82a1-11ec-9502-3a30aa7aa275/original.jpeg',
                        isHomePlayer: true,
                        score: 30,
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
              ),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  reverse: false,
                  // onPageChanged: (value) => ,
                  children: [
                    OddOneOutGameView(nextPage, _pageController, 0),
                    OddOneOutGameView(nextPage, _pageController, 1),
                    OddOneOutGameView(nextPage, _pageController, 2),
                    OddOneOutGameView(nextPage, _pageController, 3),
                    OddOneOutGameView(nextPage, _pageController, 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

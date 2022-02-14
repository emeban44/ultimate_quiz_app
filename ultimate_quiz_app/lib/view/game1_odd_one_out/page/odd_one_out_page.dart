import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/page/odd_one_out_game_view.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/pages/guessing_game_view.dart';
import 'package:ultimate_quiz_app/widgets/player_score_box.dart';

class OddOneOutPage extends StatelessWidget {
  static const String routeName = '/odd-one-out-page';
  final PageController _pageController = PageController();

  void nextPage(GameProvider gameProvider) {
    Future.delayed(
      const Duration(milliseconds: 4000),
    ).whenComplete(() {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 1300),
          curve: gameProvider.oddOneOutPageIndex == 4
              ? Curves.linearToEaseOut
              : Curves.linearToEaseOut);
      gameProvider.incrementOddOneOutIndex();
      gameProvider.game1ResetSelection();
      // Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
      //   gameProvider.game1ShouldDisableSelection = false;
      // }); OVO JE RADILO BEZ PROBLEMA

      //gameProvider.game1ShouldDisableSelection = false;
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
                  restorationId: 'game',

                  reverse: false,
                  // onPageChanged: (value) => ,
                  children: [
                    OddOneOutGameView(nextPage, _pageController, 0),
                    OddOneOutGameView(nextPage, _pageController, 1),
                    OddOneOutGameView(nextPage, _pageController, 2),
                    OddOneOutGameView(nextPage, _pageController, 3),
                    OddOneOutGameView(nextPage, _pageController, 4),
                    GuessingGameView(
                      pageController: _pageController,
                      imageURL:
                          'https://firebasestorage.googleapis.com/v0/b/ultimatequizapp.appspot.com/o/pogadjanje%2Fmekonagej.jpeg?alt=media&token=7b13c593-ae15-49ba-850b-1cbb985f3731',
                    ),
                    GuessingGameView(
                        pageController: _pageController,
                        imageURL:
                            'https://firebasestorage.googleapis.com/v0/b/ultimatequizapp.appspot.com/o/pogadjanje%2Fgavrilo.jpg?alt=media&token=6aaaf702-2a8f-45b8-a9b5-96cc2167b019'),
                    GuessingGameView(
                        pageController: _pageController,
                        imageURL:
                            'https://firebasestorage.googleapis.com/v0/b/ultimatequizapp.appspot.com/o/pogadjanje%2Fputin.jpeg?alt=media&token=9e515c3e-2d8f-4214-9cb0-8903fd1f98e0'),
                    GuessingGameView(
                        pageController: _pageController,
                        imageURL:
                            'https://firebasestorage.googleapis.com/v0/b/ultimatequizapp.appspot.com/o/pogadjanje%2Fbecker.jpeg?alt=media&token=4d673a9b-e0ee-469e-8a93-300b54e323af'),
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

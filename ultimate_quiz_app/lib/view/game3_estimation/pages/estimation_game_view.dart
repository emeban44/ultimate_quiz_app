import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/answer_column.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/firebase_image.dart';

class EstimationGameView extends StatefulWidget {
  EstimationGameView({
    required this.pageController,
    // required this.imageURL,
  });
  final PageController pageController;
  //final String imageURL;
  @override
  _EstimationGameViewState createState() => _EstimationGameViewState();
}

class _EstimationGameViewState extends State<EstimationGameView> {
  void nextView(GameProvider gameProvider) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      widget.pageController
          .nextPage(duration: const Duration(seconds: 2), curve: Curves.easeIn);
      gameProvider.incrementGuessingPageIndex();
      gameProvider.game2ResetSelection();
    });
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (gameProvider.guessingPageIndex == 0)
              ShowUpAnimation(
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 15, right: 25, left: 25),
                  child: Image.asset('assets/images/ko_je_blizi_fit.png'),
                ),
                //delayStart: const Duration(milliseconds: 2000),
                animationDuration: const Duration(seconds: 3),
                curve: Curves.decelerate,
                direction: Direction.vertical,
              )
            else
              GestureDetector(
                //onTap: () => nextView(),
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 15, right: 25, left: 25),
                  child: Image.asset('assets/images/ko_je_blizi_fit.png'),
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Koliko miliona stanovnika ima Njemačka?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Signika',
                  fontSize: 21,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              height: 55,
              alignment: Alignment.center,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white, width: 1),
                gradient: LinearGradient(colors: [
                  Colors.blue.shade100,
                  Colors.purple.shade200,
                ]),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                //textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  fontFamily: 'Lexend',
                  letterSpacing: 0.75,
                ),
                //textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(right: 0, bottom: 0.5),
                  //contentPadding: const E
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

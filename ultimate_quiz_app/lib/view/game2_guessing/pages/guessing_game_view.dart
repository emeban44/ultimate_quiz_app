import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/answer_column.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/widgets/firebase_image.dart';

class GuessingGameView extends StatefulWidget {
  GuessingGameView({
    required this.pageController,
    required this.imageURL,
  });
  final PageController pageController;
  final String imageURL;
  @override
  _GuessingGameViewState createState() => _GuessingGameViewState();
}

class _GuessingGameViewState extends State<GuessingGameView> {
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Column(
      children: [
        if (gameProvider.guessingPageIndex == 0)
          ShowUpAnimation(
            child: GestureDetector(
              onTap: () {
                widget.pageController.nextPage(
                    duration: Duration(seconds: 1), curve: Curves.easeOut);
                gameProvider.incrementGuessingPageIndex();
              },
              child: Container(
                margin: const EdgeInsets.only(
                    top: 5, bottom: 15, right: 25, left: 25),
                child: Image.asset('assets/images/pogadjanje_fit.png'),
              ),
            ),
            //delayStart: const Duration(milliseconds: 2000),
            animationDuration: const Duration(seconds: 3),
            curve: Curves.decelerate,
            direction: Direction.vertical,
          )
        else
          GestureDetector(
            onTap: () {
              widget.pageController.nextPage(
                  duration: Duration(seconds: 1), curve: Curves.easeOut);
            },
            child: Container(
              margin: const EdgeInsets.only(
                  top: 5, bottom: 15, right: 25, left: 25),
              child: Image.asset('assets/images/pogadjanje_fit.png'),
            ),
          ),
        FirebaseImage(widget.imageURL, gameProvider),
        GuessingAnswerColumn(gameProvider),
      ],
    );
  }
}

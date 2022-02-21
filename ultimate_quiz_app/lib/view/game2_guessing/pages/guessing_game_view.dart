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
    // required this.imageURL,
  });
  final PageController pageController;
  //final String imageURL;
  @override
  _GuessingGameViewState createState() => _GuessingGameViewState();
}

class _GuessingGameViewState extends State<GuessingGameView> {
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
    return Column(
      children: [
        if (gameProvider.guessingPageIndex == 0)
          ShowUpAnimation(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 5, bottom: 15, right: 25, left: 25),
              child: Image.asset('assets/images/pogadjanje_fix.png'),
            ),
            delayStart: const Duration(milliseconds: 500),
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
              child: Image.asset('assets/images/pogadjanje_fix.png'),
            ),
          ),
        FirebaseImage(
            gameProvider
                .guessQuestions[gameProvider.guessingPageIndex].imageURL!,
            gameProvider),
        GuessingAnswerColumn(gameProvider, nextView),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

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
    return Container(
      child: Column(
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
                      top: 10, bottom: 20, right: 15, left: 15),
                  child: Image.asset('assets/images/pogadjanje_fit.png'),
                ),
              ),
              delayStart: const Duration(milliseconds: 0),
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
                    top: 10, bottom: 20, right: 15, left: 15),
                child: Image.asset('assets/images/pogadjanje_fit.png'),
              ),
            ),
          ShowUpAnimation(
            delayStart: const Duration(milliseconds: 1000),
            animationDuration: const Duration(seconds: 2),
            curve: Curves.easeIn,
            direction: Direction.vertical,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(2, 5),
                  spreadRadius: 4,
                  blurRadius: 10,
                )
              ]),
              constraints: BoxConstraints(maxHeight: 250),
              //padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  imageUrl: widget.imageURL,
                  // 'https://firebasestorage.googleapis.com/v0/b/ultimatequizapp.appspot.com/o/pogadjanje%2Fmekonagej.jpeg?alt=media&token=7b13c593-ae15-49ba-850b-1cbb985f3731',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

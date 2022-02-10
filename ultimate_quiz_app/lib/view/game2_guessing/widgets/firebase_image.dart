import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';

class FirebaseImage extends StatelessWidget {
  FirebaseImage(this.imageURL, this.gameProvider);
  final String imageURL;
  final GameProvider gameProvider;
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      delayStart: Duration(
          milliseconds: gameProvider.guessingPageIndex == 0 ? 1500 : 0),
      animationDuration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      offset: 0.1,
      direction: Direction.vertical,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(2, 4),
              spreadRadius: 4,
              blurRadius: 15,
            )
          ],
        ),
        constraints: BoxConstraints(maxHeight: 240),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            imageUrl: imageURL,
          ),
        ),
      ),
    );
  }
}

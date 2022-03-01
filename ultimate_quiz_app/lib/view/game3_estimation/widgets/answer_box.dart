import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EstimationAnswerBox extends StatelessWidget {
  EstimationAnswerBox(this.title, this.score);
  final String title;
  final String score;
  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1),
      delayStart: Duration(milliseconds: title == 'Ti:' ? 0 : 1000),
      child: Container(
        margin: const EdgeInsets.only(top: 12.5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black38,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Signika',
                fontSize: 22,
                //fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                score,
                style: const TextStyle(fontFamily: 'Acme'),
              ),
            ),
          ],
        ),
      ),
    );
    // ShowUpAnimation(
    //   curve: Curves.easeOut,
    //   animationDuration: const Duration(seconds: 1),
    //   delayStart: const Duration(milliseconds: 1000),
    //   child: Container(
    //     margin: const EdgeInsets.only(top: 12.5),
    //     padding: const EdgeInsets.symmetric(horizontal: 10),
    //     decoration: BoxDecoration(
    //       color: Colors.black38,
    //       border: Border.all(color: Colors.white),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     child: Row(
    //       children: [
    //         const Text(
    //           'Protivnik:',
    //           style: TextStyle(
    //             fontFamily: 'Signika',
    //             fontSize: 22,
    //             //fontWeight: FontWeight.bold,
    //             letterSpacing: 0.5,
    //           ),
    //         ),
    //         Container(
    //           margin: const EdgeInsets.only(left: 10),
    //           child: Text(
    //             '59',
    //             style: TextStyle(fontFamily: 'Acme'),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
  }
}

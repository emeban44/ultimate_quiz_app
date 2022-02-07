import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/widgets/answer_box.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/widgets/answer_column.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/widgets/bottom_timer_widget.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/widgets/game_column.dart';

class OddOneOutGameView extends StatelessWidget {
  OddOneOutGameView(this.nextPage, this._pageController, this.pageIndex);
  final Function nextPage;
  final PageController _pageController;
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          if (pageIndex == 0)
            ShowUpAnimation(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 15, bottom: 25, right: 12.5, left: 12.5),
                child: Image.asset('assets/images/izbaci_uljeza_fit.png'),
              ),
              delayStart: const Duration(milliseconds: 0),
              animationDuration: const Duration(seconds: 3),
              curve: Curves.decelerate,
              direction: Direction.vertical,
            )
          else
            Container(
              margin: const EdgeInsets.only(
                  top: 15, bottom: 25, right: 12.5, left: 12.5),
              child: Image.asset('assets/images/izbaci_uljeza_fit.png'),
            ),
          OddOneOutGameColumn(nextPage),
        ],
      ),
    );
  }
}

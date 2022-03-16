import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/game_column.dart';

class SortByGameView extends StatefulWidget {
  const SortByGameView(this._pageController, {Key? key}) : super(key: key);
  final PageController _pageController;

  @override
  State<SortByGameView> createState() => _SortByGameViewState();
}

class _SortByGameViewState extends State<SortByGameView> {
  void nextView(GameProvider gameProvider) {
    Future.delayed(const Duration(seconds: 13)).then((value) {
      widget._pageController.nextPage(
          duration: Duration(
              milliseconds: gameProvider.sortByPageIndex == 1 ? 1750 : 1000),
          curve: gameProvider.sortByPageIndex == 1
              ? Curves.easeInToLinear
              : Curves.easeIn);
      gameProvider.incrementSortByIndex();
      gameProvider.game4ResetSelection();
    });
  }

  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            if (gameProvider.sortByPageIndex == 0)
              GestureDetector(
                //onTap: () => nextView(gameProvider),
                child: ShowUpAnimation(
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 15, right: 25, left: 25),
                    child: Image.asset('assets/images/poredaj_po_fit.png'),
                  ),
                  delayStart: const Duration(milliseconds: 1250),
                  animationDuration: const Duration(seconds: 3),
                  curve: Curves.decelerate,
                  direction: Direction.vertical,
                ),
              )
            else
              GestureDetector(
                //onTap: () => nextView(),
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 15, right: 25, left: 25),
                  child: Image.asset('assets/images/poredaj_po_fit.png'),
                ),
              ),
            SortByGameColumn(nextView),
          ],
        ),
      ),
    );
  }
}

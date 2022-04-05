import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/widgets/game_column.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/widgets/game_column.dart';

class GeneralKnowledgeGameView extends StatefulWidget {
  const GeneralKnowledgeGameView(this._pageController, {Key? key})
      : super(key: key);
  final PageController _pageController;

  @override
  State<GeneralKnowledgeGameView> createState() =>
      _GeneralKnowledgeGameViewState();
}

class _GeneralKnowledgeGameViewState extends State<GeneralKnowledgeGameView> {
  void nextView(GameProvider gameProvider) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      widget._pageController
          .nextPage(duration: const Duration(seconds: 1), curve: Curves.easeIn);
      gameProvider.incrementGeneralKnowledgeIndex();
      gameProvider.game5ResetSelection();
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
        physics: const ClampingScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              if (gameProvider.generalKnowledgePageIndex == 0)
                GestureDetector(
                  //onTap: () => nextView(gameProvider),
                  child: ShowUpAnimation(
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 25, left: 25),
                      child: Image.asset('assets/images/opce_znanje_fit.png'),
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
                        top: 5, bottom: 5, right: 25, left: 25),
                    child: Image.asset('assets/images/opce_znanje_fit.png'),
                  ),
                ),
              GeneralKnowledgeGameColumn(nextView),
            ],
          ),
        ),
      ),
    );
  }
}

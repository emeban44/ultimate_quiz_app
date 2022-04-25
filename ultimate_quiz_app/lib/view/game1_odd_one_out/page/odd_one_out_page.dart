import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/page/odd_one_out_game_view.dart';
import 'package:ultimate_quiz_app/view/game2_guessing/pages/guessing_game_view.dart';
import 'package:ultimate_quiz_app/view/game3_estimation/pages/estimation_game_view.dart';
import 'package:ultimate_quiz_app/view/game4_sort_by/page/sort_by_game_view.dart';
import 'package:ultimate_quiz_app/view/game5_general_knowledge/page/general_knowledge_page.dart';
import 'package:ultimate_quiz_app/widgets/player_score_box.dart';

class OddOneOutPage extends StatelessWidget {
  static const String routeName = '/odd-one-out-page';
  final PageController _pageController = PageController();

  void nextPage(GameProvider gameProvider) {
    Future.delayed(
      const Duration(milliseconds: 3250),
    ).whenComplete(() {
      _pageController.nextPage(
          duration: Duration(
              milliseconds: gameProvider.oddOneOutPageIndex == 4 ? 1750 : 1000),
          curve: gameProvider.oddOneOutPageIndex == 4
              ? Curves.easeInToLinear // linear
              : Curves.easeIn);
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
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 1,
          image: AssetImage("assets/images/neon_smoke_light.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: WillPopScope(
          onWillPop: () async => false,
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
                          imageURL: authProvider.userProfile!.imageURL!,
                          isHomePlayer: true,
                          score: 30,
                          username: '@' + authProvider.userProfile!.username!,
                        ),
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
                        GuessingGameView(pageController: _pageController),
                        GuessingGameView(pageController: _pageController),
                        GuessingGameView(pageController: _pageController),
                        GuessingGameView(pageController: _pageController),
                        GuessingGameView(pageController: _pageController),
                        EstimationGameView(pageController: _pageController),
                        EstimationGameView(pageController: _pageController),
                        EstimationGameView(pageController: _pageController),
                        EstimationGameView(pageController: _pageController),
                        EstimationGameView(pageController: _pageController),
                        SortByGameView(_pageController),
                        SortByGameView(_pageController),
                        GeneralKnowledgeGameView(_pageController),
                        GeneralKnowledgeGameView(_pageController),
                        GeneralKnowledgeGameView(_pageController),
                        GeneralKnowledgeGameView(_pageController),
                        GeneralKnowledgeGameView(_pageController),
                        GeneralKnowledgeGameView(_pageController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

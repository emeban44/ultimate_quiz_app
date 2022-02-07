import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/utils/navigation_animations.dart';
import 'package:ultimate_quiz_app/view/classic/pages/classic_start_page.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/page/odd_one_out_page.dart';
import 'package:ultimate_quiz_app/view/game_page_view/pages/games_page_view.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/page/game_start_lobby_page.dart';

import 'package:ultimate_quiz_app/view/splash/splash_screen.dart';

mixin RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return SlideAnimationTween(
          widget: SplashScreen(),
        );
      case ClassicStartPage.routeName:
        return SlideAnimationTween(
          widget: ClassicStartPage(),
        );
      case GameStartLobbyPage.routeName:
        return SlideAnimationTween(
          widget: GameStartLobbyPage(),
        );
      case OddOneOutPage.routeName:
        return SlideAnimationTween(
          widget: OddOneOutPage(),
        );
      // case GamesPageView.routeName:
      //   return SlideAnimationTween(
      //     widget: GamesPageView(),
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<void>(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Container(
            child: const Text('Error Screen'),
          ),
        ),
      );
    });
  }
}

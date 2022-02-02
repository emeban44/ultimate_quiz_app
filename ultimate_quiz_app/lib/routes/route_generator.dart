import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/utils/navigation_animations.dart';
import 'package:ultimate_quiz_app/view/classic/pages/classic_start_page.dart';

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

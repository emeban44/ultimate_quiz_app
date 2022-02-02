import 'package:flutter/material.dart';

class SlideAnimationTween extends PageRouteBuilder<dynamic> {
  SlideAnimationTween({required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            const Offset begin = Offset(1.0, 0.0);
            const Offset end = Offset.zero;
            final Cubic curve = Curves.ease;
            final Animatable<Offset> tween =
                Tween<Offset>(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
  final Widget widget;
}

class FadeAnimationTween extends PageRouteBuilder<dynamic> {
  FadeAnimationTween({required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            const Offset begin = Offset(1.0, 0.0);
            const Offset end = Offset.zero;
            final Cubic curve = Curves.ease;
            final Animatable<Offset> tween =
                Tween<Offset>(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
  final Widget widget;
}

class ScaleAnimationTween extends PageRouteBuilder<dynamic> {
  ScaleAnimationTween({required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            const Offset begin = Offset(1.0, 0.0);
            const Offset end = Offset.zero;
            final Cubic curve = Curves.ease;
            final Animatable<Offset> tween =
                Tween<Offset>(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        );
  final Widget widget;
}

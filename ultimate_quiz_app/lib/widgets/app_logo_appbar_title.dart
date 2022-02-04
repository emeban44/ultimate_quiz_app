import 'package:flutter/material.dart';

class AppLogoAppBarTitle extends StatelessWidget {
  AppLogoAppBarTitle(this.size);
  final double size;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/strucnjak.png",
      height: size,
      width: size,
      filterQuality: FilterQuality.high,
    );
  }
}

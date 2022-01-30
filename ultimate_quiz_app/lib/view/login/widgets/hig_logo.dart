import 'package:flutter/material.dart';

class HigLoginLogo extends StatelessWidget {
  const HigLoginLogo(this.isSignUp);
  final bool isSignUp;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: isSignUp ? 5 : 25),
      child: Image.asset(
        "assets/images/higlogo_whitestrongest.png",
        height: isSignUp ? 45 : 125,
      ),
    );
  }
}

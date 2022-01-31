import 'package:flutter/material.dart';

class HomeTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Icon(
            Icons.home_filled,
            size: 200,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

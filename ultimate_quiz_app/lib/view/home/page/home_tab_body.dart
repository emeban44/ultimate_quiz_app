import 'package:flutter/material.dart';

class HomeTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 1500,
          ),
          Icon(
            Icons.ac_unit,
            size: 200,
          )
        ],
      ),
    );
  }
}

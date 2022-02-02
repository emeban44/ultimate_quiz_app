import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/classic/pages/classic_start_page.dart';
import 'package:ultimate_quiz_app/view/home/widgets/play/play_button.dart';

class PlayTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,
      padding: const EdgeInsets.only(bottom: 50),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              'Izaberi vrstu igre:',
              style: TextStyle(
                fontFamily: 'Acme',
                fontSize: 30,
              ),
            ),
          ),
          PlayButton('CLASSIC', () {
            Navigator.pushNamed(context, ClassicStartPage.routeName);
          }),
          PlayButton('RANKED', () {}),
          PlayButton('MINI IGRE', () {}),
        ],
      ),
    );
  }
}

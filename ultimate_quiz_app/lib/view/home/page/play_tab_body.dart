import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/classic/pages/classic_start_page.dart';
import 'package:ultimate_quiz_app/view/home/widgets/play/play_button.dart';
import 'package:ultimate_quiz_app/widgets/app_logo_appbar_title.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class PlayTabBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400,
      //margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
      alignment: Alignment.center,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // flex: 1,
            margin: const EdgeInsets.only(bottom: 35),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5, top: 30),
                  child: AppLogoAppBarTitle(175),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontFamily: 'Retrolight', fontSize: 17),
                    children: [
                      TextSpan(text: 'KO NE ZNA, ', style: TextStyle(color: Colors.blue.shade300)),
                      TextSpan(text: 'ZNAT', style: TextStyle(color: Colors.pinkAccent.shade100)),
                      const TextSpan(text: ' CE POSLIJE', style: TextStyle(color: Colors.greenAccent)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            //flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PlayButton('CLASSIC', () {
                  Navigator.pushNamed(context, ClassicStartPage.routeName);
                }),
                PlayButton('RANKED', () async {
                  await FirebaseAnalytics.instance.logEvent(name: 'EMPA PROBAO NESTO');
                }),
                PlayButton('MINI IGRE', () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

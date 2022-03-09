import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/game1_odd_one_out/page/odd_one_out_page.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/widgets/opponent_lobby_widget.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/widgets/player_lobby_card.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/widgets/player_lobby_stats.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/widgets/press_start_button.dart';
import 'package:ultimate_quiz_app/widgets/app_logo_appbar_title.dart';
import 'package:ultimate_quiz_app/widgets/loader_dialog.dart';

class GameStartLobbyPage extends StatefulWidget {
  static const String routeName = '/game-start-lobby';

  @override
  State<GameStartLobbyPage> createState() => _GameStartLobbyPageState();
}

class _GameStartLobbyPageState extends State<GameStartLobbyPage> {
  bool isHomePlayerReady = false;

  bool shouldShowOpponent = false;

  int countdownNumber = 3;

  void onReadyPressed() {
    setState(() {
      isHomePlayerReady = !isHomePlayerReady;
    });
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      onOpponentReady();
    });
  }

  void onOpponentReady() async {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    setState(() {
      shouldShowOpponent = !shouldShowOpponent;
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdownNumber--;
        if (countdownNumber == 0 || (timer.tick == 6)) {
          timer.cancel();
          Navigator.pushReplacementNamed(context, OddOneOutPage.routeName,
              arguments: gameProvider);
        }
      });
    });
    try {
      //await gameProvider.fetchOddOneOutQuestions();
      await Future.wait([
        gameProvider.fetchOddOneOutQuestions(),
        gameProvider.fetchGuessingQuestions(),
        gameProvider.fetchEstimationQuestions(),
        gameProvider.fetchSortByQuestions(),
      ]);
    } catch (error) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 1,
          image: AssetImage("assets/images/neon_smoke.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //title: AppLogoAppBarTitle(37.5),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.popUntil(context, ModalRoute.withName('/'));
          //       },
          //       icon: Icon(Icons.gamepad))
          // ],
          centerTitle: true,
        ),
        body: Container(
          //height: MediaQuery.of(context).size.height - 200,
          padding: const EdgeInsets.only(left: 12.5, right: 12.5, top: 5),
          child: Column(
            children: [
              PlayerLobbyCard(),
              PlayerLobbyStats(),
              const Divider(
                color: Colors.white,
                thickness: 0.7,
              ),
              PressStartButton(
                  isHomePlayerReady: isHomePlayerReady,
                  onPress: onReadyPressed,
                  shouldShowOpponent: shouldShowOpponent,
                  countdownNumber: countdownNumber),
              if (shouldShowOpponent)
                const Divider(
                  color: Colors.white,
                  thickness: 0.7,
                ),
              OpponentLobbyWidget(shouldShowOpponent, isHomePlayerReady),
            ],
          ),
        ),
      ),
    );
  }
}

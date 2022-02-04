import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/widgets/opponent_lobby_widget.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/widgets/player_lobby_card.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/widgets/player_lobby_stats.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/widgets/press_start_button.dart';
import 'package:ultimate_quiz_app/widgets/loader_dialog.dart';

class GameStartLobbyPage extends StatefulWidget {
  static const String routeName = '/game-start-lobby';

  @override
  State<GameStartLobbyPage> createState() => _GameStartLobbyPageState();
}

class _GameStartLobbyPageState extends State<GameStartLobbyPage> {
  bool isHomePlayerReady = false;

  bool shouldShowOpponent = false;

  int countdownNumber = 5;

  void onReadyPressed() {
    setState(() {
      isHomePlayerReady = !isHomePlayerReady;
    });
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      onOpponentReady();
    });
  }

  void onOpponentReady() {
    setState(() {
      shouldShowOpponent = !shouldShowOpponent;
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        countdownNumber--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 1,
          image: AssetImage("assets/images/neon_lights_upside.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          //MediaQuery.of(context).size.height - 110,
          padding: const EdgeInsets.only(left: 12.5, right: 12.5, top: 12.5),
          child: Column(
            children: [
              PlayerLobbyCard(),
              PlayerLobbyStats(),
              PressStartButton(
                  isHomePlayerReady: isHomePlayerReady,
                  onPress: onReadyPressed,
                  shouldShowOpponent: shouldShowOpponent,
                  countdownNumber: countdownNumber),
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

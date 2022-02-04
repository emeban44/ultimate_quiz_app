import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/widgets/player_lobby_card.dart';
import 'package:ultimate_quiz_app/widgets/loader_dialog.dart';

import 'player_lobby_stats.dart';

class OpponentLobbyWidget extends StatelessWidget {
  OpponentLobbyWidget(this.shouldShowOpponent, this.isHomePlayerReady);
  final bool shouldShowOpponent;
  final bool isHomePlayerReady;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: shouldShowOpponent ? 12.5 : 65.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!shouldShowOpponent)
              Column(
                children: [
                  LoaderDialog(),
                  Text(
                    !isHomePlayerReady
                        ? 'Pritisnite start...'
                        : 'Čekamo protivnika...',
                    style: const TextStyle(fontFamily: 'Kalama', fontSize: 12),
                  ),
                ],
              )
            else
              Column(
                children: [
                  PlayerLobbyCard(),
                  PlayerLobbyStats(),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(vertical: 5),
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.white),
                  //   ),
                  //   child: Text(
                  //     'PROTIVNIK',
                  //     style: TextStyle(fontFamily: 'Acme'),
                  //   ),
                  // ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.7,
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}

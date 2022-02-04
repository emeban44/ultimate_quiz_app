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
        padding: EdgeInsets.only(
            top: shouldShowOpponent
                ? 12.5
                : MediaQuery.of(context).size.height * 0.11),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!shouldShowOpponent)
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoaderDialog(),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      !isHomePlayerReady
                          ? 'Pritisnite start...'
                          : 'Čekamo protivnika...',
                      style:
                          const TextStyle(fontFamily: 'Kalama', fontSize: 21),
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  PlayerLobbyCard(),
                  PlayerLobbyStats(),
                  // const Divider(
                  //   color: Colors.white,
                  //   thickness: 0.7,
                  // ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'PROTIVNIK',
                            style: TextStyle(
                              fontFamily: 'Acme',
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.person,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

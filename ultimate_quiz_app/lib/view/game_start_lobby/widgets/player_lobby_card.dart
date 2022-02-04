import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/home/page/profile_tab_body.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_avatar.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_rank_widget.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/profile_username.dart';

class PlayerLobbyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            // PROFILE CARD WITH RANK
            decoration: _profileBoxDecoration(),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: ProfileAvatar(
                    false,
                    null,
                    isInTestPhase: true,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileUsername('@biom237', gameStartLobby: true),
                        GestureDetector(
                          onTap: () => showRankSystem(context),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 1.0),
                            child:
                                ProfileRankWidget(rank: 'panj', rankLevel: '1'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), // END
        ],
      ),
    );
  }

  BoxDecoration _profileBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white, width: 0.75),
      gradient: LinearGradient(colors: [
        Colors.pink.shade900,
        Colors.blue.shade900,
      ]),
    );
  }
}

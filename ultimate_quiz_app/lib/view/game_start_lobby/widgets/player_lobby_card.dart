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
                ProfileAvatar(false, null),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileUsername('@biom237'),
                        GestureDetector(
                          onTap: () => showRankSystem(context),
                          child:
                              ProfileRankWidget(rank: 'panj', rankLevel: '1'),
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
      border: Border.all(color: Colors.white, width: 0.4),
      gradient: LinearGradient(colors: [
        Colors.pink.shade900,
        Colors.blue.shade900,
      ]),
    );
  }
}

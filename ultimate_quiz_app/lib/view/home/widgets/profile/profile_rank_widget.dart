import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/utils/rank_style_data.dart';

import 'rank_icon_text_row.dart';

class ProfileRankWidget extends StatelessWidget {
  ProfileRankWidget({
    required this.rank,
    required this.rankLevel,
  });
  final String rank;
  final String rankLevel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7.5),
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(2, 2), // changes position of shadow
              ),
            ],
            gradient: RankStyleData.getGradient(rank),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color:
                    rank == 'panj' || rank == 'strucnjak' || rank == 'diamond'
                        ? Colors.white
                        : Colors.black,
                width: rank == 'diamond' ? 0.75 : 0.5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RankIconTextRow(rank),
            _rankLevel(rankLevel),
          ],
        ),
      ),
    );
  }

  Widget _rankLevel(String rankLevel) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, top: 0),
      child: Text(
        'LVL $rankLevel',
        style: TextStyle(
          color: rank == 'silver'
              ? Colors.black
              : rank == 'diamond'
                  ? Colors.white
                  : Colors.white,
          fontFamily: 'Carter',
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}

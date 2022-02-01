import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/utils/rank_style_data.dart';

import 'rank_icon_text_row.dart';

class ProfileRankWidget extends StatelessWidget {
  ProfileRankWidget({
    required this.rank,
    required this.numberOfGames,
  });
  final String rank;
  final String numberOfGames;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7.5),
        decoration: BoxDecoration(
            gradient: RankStyleData.getGradient(rank),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: rank == 'diamond' ? Colors.black : Colors.white,
                width: rank == 'diamond' ? 1 : 0.5)),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RankIconTextRow(rank),
              _buildNumberOfGamesText(numberOfGames),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberOfGamesText(String numberOfGames) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, top: 1),
      child: Text(
        '$numberOfGames igara',
        style: TextStyle(
          color: rank == 'silver'
              ? Colors.black
              : rank == 'diamond'
                  ? Colors.black
                  : Colors.white,
          fontFamily: 'Acme',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}

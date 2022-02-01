import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/utils/rank_style_data.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/rank_icon_text_row.dart';

class RankDialogBox extends StatelessWidget {
  RankDialogBox(this.rank);
  final String rank;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 15, right: 10, top: 7.5, bottom: 7.5),
      margin: const EdgeInsets.only(bottom: 10),
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
              color: rank == 'panj' ? Colors.white : Colors.black,
              width: rank == 'diamond' ? 1 : 0.5)),
      child: RankIconTextRow(rank),
    );
  }
}

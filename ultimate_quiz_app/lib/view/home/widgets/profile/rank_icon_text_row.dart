import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/utils/rank_style_data.dart';

class RankIconTextRow extends StatelessWidget {
  const RankIconTextRow(this.rank, {Key? key}) : super(key: key);
  final String rank;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20,
          width: 20,
          child: Image.asset(
            RankStyleData.getImage(rank),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 2),
          child: Text(
            'PANJ',
            style: TextStyle(
              color: Colors.brown.shade50.withOpacity(1),
              fontFamily: 'Acme',
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}

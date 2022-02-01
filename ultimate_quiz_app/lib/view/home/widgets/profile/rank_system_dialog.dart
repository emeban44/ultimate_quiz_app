import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/dialog_rank_box.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/rank_icon_text_row.dart';

class RankSystemDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 22.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height - 225,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        //width: 200,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'RANKING SISTEM',
                style: TextStyle(
                  fontFamily: 'Acme',
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 25, bottom: 15),
                child: Column(
                  children: [
                    RankDialogBox('diamond'),
                    RankDialogBox('platinum'),
                    RankDialogBox('emerald'),
                    RankDialogBox('gold'),
                    RankDialogBox('silver'),
                    RankDialogBox('bronze'),
                    RankDialogBox('panj'),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 11.0, right: 11, bottom: 12.5),
                child: Text(
                  'Ovo što vidiš je rank sistem. Da bi se rank prešao, moraš vezati 3 rank pobjede zaredom. Svaki rank poraz, vraća te jedan korak unazad.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: 125,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink.shade800,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/dialog_rank_box.dart';
import 'package:ultimate_quiz_app/view/home/widgets/profile/rank_icon_text_row.dart';

class RankSystemDialog extends StatelessWidget {
  const RankSystemDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 22.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: MediaQuery.of(context).size.height - 200,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade50, Colors.blue.shade100],
          ),
        ),
        //width: 200,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9.0, bottom: 20),
                child: Text(
                  'RANKING SISTEM',
                  style: TextStyle(
                    fontFamily: 'Alata',
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 0, bottom: 15),
                child: Column(
                  children: [
                    RankDialogBox('strucnjak'),
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
              const Padding(
                padding: EdgeInsets.only(left: 11.0, right: 11, bottom: 15),
                child: Text(
                  'Ovo što vidiš je rank sistem. Kako bi napredovao, moraš vezati 3 rank pobjede zaredom. Svaki rank poraz, vraća te jedan korak unazad.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: 125,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'OK',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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

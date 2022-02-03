import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/app_title_classic.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/create_join_classic_button.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/create_private_game_dialog.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/join_private_game_dialog.dart';
import 'package:ultimate_quiz_app/widgets/start_game_loading_dialog.dart';

class ClassicStartPage extends StatelessWidget {
  static const String routeName = '/classic-start';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 1,
          image: AssetImage("assets/images/cool_neon_wall.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 135),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTitleClassic(),
              CreateJoinClassicButton('ZAPOČNI IGRU', () {
                showStartGameDialog(context, 'Tražimo protivnika...');
              }),
              const Divider(color: Colors.transparent),
              CreateJoinClassicButton('KREIRAJ PRIVATNU IGRU', () {
                showCreatePrivateGameDialog(context);
              }),
              CreateJoinClassicButton('PRIDRUŽI SE PRIVATNOJ IGRI', () {
                showJoinPrivateGameDialog(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

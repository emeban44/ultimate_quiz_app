import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/create_join_classic_button.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/create_private_game_dialog.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/join_private_game_dialog.dart';
import 'package:ultimate_quiz_app/widgets/loader_dialog.dart';
import 'package:ultimate_quiz_app/widgets/start_game_loading_dialog.dart';

class ClassicStartPage extends StatelessWidget {
  static const String routeName = '/classic-start';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 1,
          image: const AssetImage("assets/images/cool_neon_wall.jpeg"),
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
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CreateJoinClassicButton('ZAPOČNI IGRU', () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StartGameLoaderDialog('Tražimo protivnika...');
                    });
              }),
              Divider(),
              CreateJoinClassicButton('KREIRAJ PRIVATNU IGRU', () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CreatePrivateGameDialog();
                    });
              }),
              //CreateJoinClassicButton('PRIDRUŽI SE JAVNOJ IGRI', () {}),
              CreateJoinClassicButton('PRIDRUŽI SE PRIVATNOJ IGRI', () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return JoinPrivateGameDialog();
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

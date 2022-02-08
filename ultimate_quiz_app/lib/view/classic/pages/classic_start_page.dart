import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/game_provider.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/app_title_classic.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/create_join_classic_button.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/create_private_game_dialog.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/join_private_game_dialog.dart';
import 'package:ultimate_quiz_app/view/game_start_lobby/page/game_start_lobby_page.dart';
import 'package:ultimate_quiz_app/widgets/app_logo_appbar_title.dart';
import 'package:ultimate_quiz_app/widgets/start_game_loading_dialog.dart';

class ClassicStartPage extends StatelessWidget {
  static const String routeName = '/classic-start';
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider =
        Provider.of<GameProvider>(context, listen: false);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 1,
          image: AssetImage("assets/images/cool_neon_wall.jpeg"),
          // image: AssetImage(
          //     'assets/images/neon_lights_upside.jpeg'), //
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black38,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
          title: AppLogoAppBarTitle(40),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await gameProvider.addOddOneOutQuestionToDB();
                },
                icon: Icon(Icons.api))
          ],
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
                Future.delayed(
                  const Duration(seconds: 1),
                ).whenComplete(() {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, GameStartLobbyPage.routeName,
                      arguments: gameProvider);
                });
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

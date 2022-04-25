import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/private_game_password_field.dart';
import 'package:ultimate_quiz_app/widgets/start_game_loading_dialog.dart';

class JoinPrivateGameDialog extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool didClickButton = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.blue.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: 240,
        width: 300,
        //padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildDialogTitle(context),
                _buildDialogHint(context),
              ],
            ),
            Column(
              children: [
                _buildGamePasswordField(context),
                _buildJoinGameButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogTitle(BuildContext context) {
    return const Text(
      'PRIDRUŽI SE PRIVATNOJ IGRI:',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'Sarala',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDialogHint(BuildContext context) {
    return const Text(
      'Ukucaj šifru koju ti je proslijedio prijatelj😄',
      textAlign: TextAlign.center,
      style: TextStyle(
        inherit: false,
        color: Colors.black,
        fontFamily: 'Lato',
        fontSize: 11.5,
      ),
    );
  }

  Widget _buildJoinGameButton(BuildContext context) {
    return Container(
      height: 45,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )
            //elevation: 10,
            ),
        onPressed: () {
          didClickButton = true;
          final bool isValid = _formKey.currentState!.validate();
          if (isValid) {
            Navigator.pop(context);
            showStartGameDialog(context, 'Učitavanje igre...');
          }
        },
        child: const Text(
          'PRIDRUŽI SE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget _buildGamePasswordField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      child: Form(
        key: _formKey,
        child: PrivateGamePasswordField('ŠIFRA IGRE', () {
          if (didClickButton) {
            _formKey.currentState!.validate();
          }
        }),
      ),
    );
  }
}

void showJoinPrivateGameDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return JoinPrivateGameDialog();
      });
}

import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/classic_text_form_field.dart';
import 'package:ultimate_quiz_app/widgets/start_game_loading_dialog.dart';

class CreatePrivateGameDialog extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Dialog(
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
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildGamePasswordField(context),
                _buildCreateGameButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogTitle(BuildContext context) {
    return const Text(
      'KREIRAJ PRIVATNU IGRU:',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Sarala',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDialogHint(BuildContext context) {
    return const Text(
      'Postavi šifru koju ćeš proslijediti svom prijatelju😄',
      textAlign: TextAlign.center,
      style: TextStyle(
        inherit: false,
        color: Colors.black,
        fontFamily: 'Lato',
        fontSize: 11.5,
      ),
    );
  }

  Widget _buildGamePasswordField(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      child: Form(
        key: _formKey,
        child: PrivateGamePasswordField('ŠIFRA IGRE', () {
          _formKey.currentState!.validate();
        }),
      ),
    );
  }

  Widget _buildCreateGameButton(BuildContext context) {
    return Container(
      height: 45,
      width: 125,
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
          final bool isValid = _formKey.currentState!.validate();
          if (isValid) {
            Navigator.pop(context);
            // POZIV NA SERVER DA SE KREIRA IGRA
            showStartGameDialog(context, 'Kreiranje igre...');
          }
        },
        child: const Text(
          'KREIRAJ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

void showCreatePrivateGameDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CreatePrivateGameDialog();
      });
}

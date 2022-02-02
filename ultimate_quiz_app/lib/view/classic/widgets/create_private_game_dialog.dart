import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/classic_text_form_field.dart';
import 'package:ultimate_quiz_app/widgets/start_game_loading_dialog.dart';

class CreatePrivateGameDialog extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 240,
        width: 300,
        //padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text(
                  'KREIRAJ PRIVATNU IGRU:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Sarala',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Postavi šifru koju ćeš proslijediti svom prijatelju😄',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    inherit: false,
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontSize: 11.5,
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: ClassicTextFormField('ŠIFRA IGRE', () {
                _formKey.currentState!.validate();
              }),
            ),
            Container(
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
                child: Text(
                  'KREIRAJ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

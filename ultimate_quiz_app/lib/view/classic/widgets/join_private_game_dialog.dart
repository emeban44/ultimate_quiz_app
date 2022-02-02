import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/view/classic/widgets/classic_text_form_field.dart';

class JoinPrivateGameDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 250,
        width: 300,
        //padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'PRIDRUŽI SE PRIVATNOJ IGRI:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Sarala',
                fontWeight: FontWeight.bold,
              ),
            ),
            ClassicTextFormField('ŠIFRA'),
            Container(
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
                onPressed: () {},
                child: Text(
                  'PRIDRUŽI SE',
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

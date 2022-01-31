import 'package:flutter/material.dart';

class QuizErrorDialog extends StatelessWidget {
  QuizErrorDialog(this.errorMessage);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 250,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "GREŠKA",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Lato',
                fontSize: 15,
                inherit: false,
              ),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

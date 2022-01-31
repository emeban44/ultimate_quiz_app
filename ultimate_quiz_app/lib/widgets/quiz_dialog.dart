import 'package:flutter/material.dart';

class QuizDialog extends StatelessWidget {
  QuizDialog(this.errorMessage);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 250,
        color: Colors.white,
        child: Column(
          children: [
            Text(
              'Email nije pravilan, molimo ukucajte opet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lato',
                fontSize: 15,
                inherit: false,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        ),
      ),
    );
  }
}

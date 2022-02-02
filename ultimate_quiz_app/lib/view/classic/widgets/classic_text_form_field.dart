import 'package:flutter/material.dart';

class ClassicTextFormField extends StatelessWidget {
  ClassicTextFormField(this.hint);
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
        gradient: LinearGradient(colors: [
          Colors.blue.shade200,
          Colors.purple.shade400,
        ]),
      ),
      child: TextFormField(
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.deepPurple.shade900,
          fontFamily: 'Sarala',
        ),
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 17.5),
            hintStyle: TextStyle(
              fontFamily: 'Sarala',
              fontSize: 20,
              color: Colors.deepPurple.shade900.withOpacity(0.7),
              fontWeight: FontWeight.w900,
            )),
      ),
    );
  }
}

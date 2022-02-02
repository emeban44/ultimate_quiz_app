import 'package:flutter/material.dart';

class ClassicTextFormField extends StatelessWidget {
  ClassicTextFormField(this.hint, this.onChange);
  final String hint;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 60,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
        gradient: LinearGradient(colors: [
          Colors.blue.shade200,
          Colors.purple.shade300,
        ]),
      ),
      child: TextFormField(
        onChanged: (sifra) {
          onChange();
        },
        validator: (value) {
          if (value!.length < 4) {
            return "Šifra mora imati minimalno 4 znaka";
          }
          return null;
        },
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19,
          color: Colors.deepPurple.shade900,
          fontFamily: 'Sarala',
        ),
        decoration: InputDecoration(
            hintText: hint,
            errorStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.redAccent.shade700,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 17.5),
            hintStyle: TextStyle(
              fontFamily: 'Sarala',
              fontSize: 19,
              color: Colors.deepPurple.shade900.withOpacity(0.7),
              fontWeight: FontWeight.w900,
            )),
      ),
    );
  }
}

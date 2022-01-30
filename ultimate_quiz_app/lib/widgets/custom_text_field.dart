import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hint,
    this.isObscure = false,
  }) : super(key: key);
  final String? hint;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        gradient: LinearGradient(colors: [
          Colors.purple.shade100,
          Colors.blue.shade200,
          // Colors.purple.shade400,
          Colors.purple.shade300,
        ]),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
      child: TextField(
        autocorrect: false,
        obscureText: isObscure ? true : false,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Lato',
          fontSize: 16,
        ),
        //obscureText: true,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,

            //fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

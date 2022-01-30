import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.hint,
    this.isObscure = false,
    this.validation,
    this.onChange,
    this.controller,
  }) : super(key: key);
  final String? hint;
  bool isObscure;
  final String? Function(String?)? validation;
  final String? Function(String?)? onChange;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        gradient: LinearGradient(colors: [
          //Colors.purple.shade100,
          Colors.blue.shade200,
          Colors.purple.shade100,
          // Colors.purple.shade400,
          Colors.purple.shade300,
        ]),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
      child: TextFormField(
        autocorrect: false,
        controller: widget.controller,
        obscureText: showPass
            ? false
            : widget.isObscure
                ? true
                : false,
        onChanged: widget.onChange ?? (String? value) {},
        validator: widget.validation ??
            (String? value) {
              if (value!.isEmpty) {
                return 'error';
              } else {
                return null;
              }
            },
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Lato',
          fontSize: 16.5,
          fontWeight: widget.isObscure ? FontWeight.w600 : FontWeight.w500,
        ),
        //obscureText: true,
        decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: widget.isObscure
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      //widget.isObscure = !widget.isObscure;
                      showPass = !showPass;
                    });
                  },
                  child: showPass
                      ? Icon(
                          Icons.visibility,
                          size: 28,
                        )
                      : Icon(
                          Icons.visibility_off,
                          size: 28,
                        ),
                )
              : null,
          hintStyle: TextStyle(
            fontFamily: 'Lato',

            fontSize: 16,
            fontWeight: FontWeight.normal,
            //fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

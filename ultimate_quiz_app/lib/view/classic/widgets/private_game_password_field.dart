import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class PrivateGamePasswordField extends StatelessWidget {
  PrivateGamePasswordField(this.hint, this.onChange);
  final String hint;
  final Function onChange;

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 60,
      padding: const EdgeInsets.only(left: 20, bottom: 3, top: 2.5),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
        gradient: LinearGradient(colors: [
          Colors.blue.shade200,
          Colors.purple.shade300,
        ]),
      ),
      child: TextFormField(
        controller: _controller,
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
        autocorrect: false,
        decoration: InputDecoration(
            hintText: hint,
            suffixIconColor: Colors.black,
            suffixIcon: GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: _controller.text));
                showToast(
                  'Kopirano',
                  borderRadius: BorderRadius.circular(15),
                  textStyle: const TextStyle(fontSize: 25, color: Colors.white),
                  context: context,
                  //backgroundColor: Colors.blue,
                  animation: StyledToastAnimation.scale,
                  reverseAnimation: StyledToastAnimation.fade,
                  position: StyledToastPosition.bottom,
                  animDuration: const Duration(seconds: 1),
                  duration: const Duration(seconds: 2),
                  curve: Curves.elasticOut,
                  reverseCurve: Curves.linear,
                );
              },
              child: const Icon(
                Icons.copy,
                color: Colors.black,
              ),
            ),
            errorStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.redAccent.shade700,
            ),
            border: InputBorder.none,
            //contentPadding: const EdgeInsets.all(1),
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

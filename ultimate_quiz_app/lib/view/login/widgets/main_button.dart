import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    this.buttonTitle,
    this.onPress,
  });
  final String? buttonTitle;
  final Function? onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 175,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: () => onPress!(),
        child: Text(
          buttonTitle!,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            //fontSize: 17,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 10,
          primary: Colors.pink.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.5),
            side: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

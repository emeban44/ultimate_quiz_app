import 'package:flutter/material.dart';

class SortByConfirmButton extends StatelessWidget {
  const SortByConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      child: const Text(
        'POTVRDI',
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

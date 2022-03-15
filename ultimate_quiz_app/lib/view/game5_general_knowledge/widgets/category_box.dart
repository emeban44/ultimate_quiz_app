import 'package:flutter/material.dart';

class GeneralKnowledgeCategoryBox extends StatelessWidget {
  const GeneralKnowledgeCategoryBox(this.category, {Key? key})
      : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: 150, maxWidth: 150, maxHeight: 40, minHeight: 40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7.5),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue.shade900,
              Colors.pink.shade900,
            ]),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white),
            boxShadow: const [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 2,
                color: Colors.blue,
              ),
            ]),
        child: FittedBox(
            child: Text(
          category,
          style: const TextStyle(
              fontFamily: 'Signika', fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GeneralKnowledgeResultTitleText extends StatelessWidget {
  const GeneralKnowledgeResultTitleText(this.title, {Key? key})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontFamily: 'Signika', fontSize: 19),
      ),
    );
  }
}

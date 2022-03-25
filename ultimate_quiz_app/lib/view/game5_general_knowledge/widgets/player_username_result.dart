import 'package:flutter/material.dart';

class GeneralKnowledgePlayerUsernameResult extends StatelessWidget {
  const GeneralKnowledgePlayerUsernameResult(this.username, this.attackChance,
      {Key? key})
      : super(key: key);
  final String username;
  final bool attackChance;
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.pink.shade900.withOpacity(0.5),
              Colors.blue.shade900.withOpacity(0.5)
            ])),
            child: Text(
              username,
              style: TextStyle(
                color: Colors.blue.shade50,
                fontSize: 20,
                fontFamily: 'Signika',
              ),
            ),
          ),
          if (attackChance)
            const Text(' - prilika za napad:',
                style: TextStyle(color: Colors.white, fontSize: 17)),
        ],
      ),
      // child: RichText(
      //   text: TextSpan(
      //     style: const TextStyle(fontFamily: 'Signika', fontSize: 20),
      //     children: [
      //       TextSpan(
      //         text: username,
      //         style: TextStyle(color: Colors.blue.shade50),
      //       ),
      //       if (attackChance)
      //         const TextSpan(
      //             text: ' - prilika za napad:',
      //             style: TextStyle(color: Colors.white, fontSize: 17)),
      //     ],
      //   ),
      // ),
    );
  }
}

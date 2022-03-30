import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

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
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue.shade100),
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Colors.pink.shade900.withOpacity(0.5),
                Colors.blue.shade900.withOpacity(0.5)
              ]),
            ),
            child: Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 5),
                Text(
                  username,
                  style: TextStyle(
                    color: Colors.blue.shade50,
                    fontSize: 17,
                    fontFamily: 'Signika',
                  ),
                ),
              ],
            ),
          ),
          if (attackChance)
            const Text(' - prilika za napad:',
                style: TextStyle(
                    color: Colors.white, fontSize: 17, fontFamily: 'Signika')),
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

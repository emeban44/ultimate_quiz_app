// import 'package:flutter/material.dart';
// import 'package:show_up_animation/show_up_animation.dart';
// import 'package:ultimate_quiz_app/view/game1_odd_one_out/widgets/answer_box.dart';
// import 'package:ultimate_quiz_app/view/game1_odd_one_out/widgets/answer_column.dart';

// class OddOneOutGameView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           ShowUpAnimation(
//             child: Container(
//               // height: 125,
//               margin: const EdgeInsets.only(top: 15, bottom: 30),
//               // width: 300,
//               child: Image.asset('assets/images/izbaci_uljeza_fit.png'),
//             ),
//             delayStart: const Duration(milliseconds: 20),
//             animationDuration: const Duration(seconds: 1),
//           ),
//           OddOneOutAnswerColumn(),
//           SafeArea(
//             child: Expanded(
//               child: Container(
//                 alignment: Alignment.center,
//                 child: Text(
//                   '10', //'( Jedan od ponuđenih nije teniser )',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 30,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

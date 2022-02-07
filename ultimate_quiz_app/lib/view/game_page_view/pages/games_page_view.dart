// import 'package:flutter/material.dart';
// import 'package:ultimate_quiz_app/view/game_page_view/pages/prva_igra_test_page_view.dart';

// class OddOneOutPageView extends StatelessWidget {
//   static const String routeName = '/page-view';

//   final PageController _pageController = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           GestureDetector(
//             onTap: () {
//               _pageController.nextPage(
//                   duration: Duration(seconds: 1), curve: Curves.bounceOut);
//             },
//             child: Text(
//               'xxx vs xxxxx',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 100,
//               ),
//             ),
//           ),
//           Expanded(
//             child: PageView(
//               controller: _pageController,
//               children: [
//                 TestIzbaciUljeza(),
//                 TestIzbaciUljeza(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

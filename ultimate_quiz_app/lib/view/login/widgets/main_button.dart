// import 'package:flutter/material.dart';

// class MainButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 175,
//       margin: const EdgeInsets.only(top: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: ElevatedButton(
//         onPressed: () async {
//           if (didClickLogin == false) {
//             setState(() {
//               didClickLogin = true;
//             });
//           }
//           final bool isValid = _loginKey.currentState!.validate();
//           if (isValid) {
//             try {
//               await FirebaseAuth.instance
//                   .createUserWithEmailAndPassword(
//                       email: _email.text, password: _password.text)
//                   .then((value) {});
//             } catch (error) {
//               log(error.toString());
//             }
//           }
//         },
//         child: Text(
//           'REGISTRUJ SE',
//           style: TextStyle(
//             fontWeight: FontWeight.w800,
//             //fontSize: 17,
//           ),
//         ),
//         style: ElevatedButton.styleFrom(
//           elevation: 10,
//           primary: Colors.purple.shade600,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.5),
//             side: BorderSide(
//               color: Colors.white,
//               width: 0.6,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

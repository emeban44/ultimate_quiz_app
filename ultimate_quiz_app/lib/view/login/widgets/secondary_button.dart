import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({this.buttonTitle, this.onPress});
  final String? buttonTitle;
  final Function? onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 10),
      height: 40,
      width: 140,
      child: ElevatedButton(
        onPressed: () => onPress!(),
        // await FirebaseAuth.instance.currentUser!
        //     .reload();
        // User? user = FirebaseAuth.instance.currentUser;
        // log(user.toString());
        // log(user!.emailVerified.toString());
        // await FirebaseAuth.instance
        //     .sendPasswordResetEmail(email: user.email!);
        // await user
        //     ?.sendEmailVerification()
        //     .whenComplete(() => log("poslano"));

        child: Text(
          buttonTitle!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo.shade800,
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

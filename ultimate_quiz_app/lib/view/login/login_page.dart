import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/widgets/custom_text_field.dart';
import 'package:ultimate_quiz_app/widgets/quiz_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  bool didClickLogin = false;

  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/cool_neon_wall.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          //extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(
                top: 100,
                right: 25,
                left: 25,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Ko ne zna,\n znat ce poslije!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Retrolight",
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        //color: Colors.white.withOpacity(0.75),
                        //borderRadius: BorderRadius.circular(15),
                        ),
                    child: Form(
                      key: _loginKey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomTextField(
                              controller: _email,
                              hint: "Email",
                              validation: (email) {},
                            ),
                          ),
                          if (isSignUp)
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: CustomTextField(
                                hint: "Username",
                                controller: _username,
                                onChange: didClickLogin
                                    ? (promjena) {
                                        _loginKey.currentState!.validate();
                                      }
                                    : null,
                                validation: (username) {
                                  if (username!.length < 4) {
                                    return "Username mora imati minimalno 4 znaka";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomTextField(
                              hint: "Password",
                              controller: _password,
                              isObscure: true,
                              onChange: didClickLogin
                                  ? (promjena) {
                                      _loginKey.currentState!.validate();
                                    }
                                  : null,
                              validation: (pass) {
                                if (pass!.length < 8) {
                                  return "Password mora imati minimalno 8 znakova";
                                }
                                return null;
                              },
                            ),
                          ),
                          if (isSignUp)
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: CustomTextField(
                                hint: "Confirm Password",
                                isObscure: true,
                                controller: _confirmPass,
                                onChange: didClickLogin
                                    ? (confirmPass) {
                                        _loginKey.currentState!.validate();
                                      }
                                    : null,
                                validation: (confirmPass) {
                                  if (confirmPass != _password.text) {
                                    return "Password se ne podudara";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          if (isSignUp)
                            Container(
                              height: 50,
                              width: 175,
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  // showDialog<void>(
                                  //   context: context,
                                  //   barrierDismissible: true,
                                  //   builder: (context) {
                                  //     return QuizDialog();
                                  //   },
                                  // );
                                  if (didClickLogin == false) {
                                    setState(() {
                                      didClickLogin = true;
                                    });
                                  }
                                  final bool isValid =
                                      _loginKey.currentState!.validate();
                                  if (isValid) {
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: _email.text,
                                              password: _password.text)
                                          .then((value) {});
                                    } catch (error) {
                                      log(error.toString());
                                    }
                                  }
                                },
                                child: Text(
                                  'REGISTRUJ SE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    //fontSize: 17,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  primary: Colors.purple.shade600,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.5),
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 0.6,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            Container(
                              height: 50,
                              width: 175,
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  // showDialog<void>(
                                  //   context: context,
                                  //   barrierDismissible: true,
                                  //   builder: (context) {
                                  //     return QuizDialog();
                                  //   },
                                  // );
                                  if (didClickLogin == false) {
                                    setState(() {
                                      didClickLogin = true;
                                    });
                                  }
                                  final bool isValid =
                                      _loginKey.currentState!.validate();
                                  if (isValid) {
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: _email.text,
                                              password: _password.text)
                                          .then((value) {});
                                    } catch (error) {
                                      log(error.toString());
                                    }
                                  }
                                },
                                child: Text(
                                  'PRIJAVI SE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    //fontSize: 17,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  primary: Colors.purple.shade600,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.5),
                                    side: BorderSide(
                                      color: Colors.white,
                                      width: 0.6,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (isSignUp)
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 16, bottom: 10),
                              height: 40,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isSignUp = false;
                                  });
                                  _loginKey.currentState!.reset();
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
                                },
                                child: Text(
                                  "PRIJAVA",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue.shade100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.5),
                                    side: BorderSide(
                                      color: Colors.lightBlue,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 16, bottom: 10),
                              height: 40,
                              width: 140,
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    isSignUp = true;
                                  });
                                  _loginKey.currentState!.reset();
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
                                },
                                child: Text(
                                  "REGISTRACIJA",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue.shade100,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.5),
                                    side: BorderSide(
                                      color: Colors.lightBlue,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print(_password.text);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: isSignUp ? 0 : 25),
                      child: Image.asset(
                        "assets/images/higlogo.png",
                        height: isSignUp ? 45 : 125,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

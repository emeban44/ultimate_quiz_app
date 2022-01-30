import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/widgets/custom_text_field.dart';
import 'package:ultimate_quiz_app/widgets/quiz_dialog.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
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
                    margin: const EdgeInsets.only(bottom: 25),
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
                              hint: "Email",
                              validation: (email) {},
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomTextField(
                              hint: "Username",
                              onChange: (promjena) {
                                _loginKey.currentState!.validate();
                              },
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
                              onChange: (promjena) {
                                _loginKey.currentState!.validate();
                              },
                              validation: (pass) {
                                if (pass!.length < 8) {
                                  return "Password mora imati minimalno 8 znakova";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomTextField(
                              hint: "Confirm Password",
                              isObscure: true,
                              controller: _confirmPass,
                              validation: (confirmPass) {
                                if (confirmPass != _password.text) {
                                  return "Password se ne podudara";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // showDialog<void>(
                                //   context: context,
                                //   barrierDismissible: true,
                                //   builder: (context) {
                                //     return QuizDialog();
                                //   },
                                // );
                                _loginKey.currentState!.validate();
                              },
                              child: Text(
                                'LOG IN',
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
                          Container(
                            margin: const EdgeInsets.only(top: 16, bottom: 10),
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "SIGN UP",
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
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/higlogo.png",
                    height: 45,
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

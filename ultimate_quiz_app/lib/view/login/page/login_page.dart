import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/main.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';
import 'package:ultimate_quiz_app/view/login/widgets/forgot_password_button.dart';
import 'package:ultimate_quiz_app/view/login/widgets/hig_logo.dart';
import 'package:ultimate_quiz_app/view/login/widgets/login_quiz_headline.dart';
import 'package:ultimate_quiz_app/view/login/widgets/main_button.dart';
import 'package:ultimate_quiz_app/view/login/widgets/secondary_button.dart';
import 'package:ultimate_quiz_app/widgets/custom_text_field.dart';
import 'package:ultimate_quiz_app/widgets/loader_dialog.dart';
import 'package:ultimate_quiz_app/widgets/quiz_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  final TextEditingController _email =
      TextEditingController(text: 'haris.mehovic@gmail.com');
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password =
      TextEditingController(text: "sarajevo1");
  final TextEditingController _confirmPass = TextEditingController();

  bool didClickLogin = false;

  bool isSignUp = false;

  void toggleSignUp(bool value) {
    final String email = _email.text;
    setState(() {
      isSignUp = value;
    });
    _password.clear();
    _loginKey.currentState!.reset();
    _email.text = email;
  }

  @override
  void initState() {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    sharedPrefs.setAuthenticated(false);
    super.initState();
  }

  @override
  void dispose() {
    //Navigator.pop(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/neon_red_blue.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: signUpBodyPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoginQuizHeadline(),
                  Form(
                    key: _loginKey,
                    child: Column(
                      children: [
                        _buildEmailField(),
                        if (isSignUp) _buildUsernameField(),
                        _buildPasswordField(),
                        if (!isSignUp) ForgotPasswordButton(),
                        if (isSignUp) _buildConfirmPasswordField(),
                        if (isSignUp)
                          MainButton(
                              buttonTitle: 'REGISTRUJ SE',
                              onPress: () async =>
                                  tryRegisterUser(authProvider))
                        else
                          MainButton(
                            buttonTitle: 'PRIJAVI SE',
                            onPress: () async => tryLoginUser(authProvider),
                          ),
                        if (isSignUp)
                          SecondaryButton(
                            buttonTitle: 'PRIJAVA',
                            onPress: () => toggleSignUp(false),
                          )
                        else
                          SecondaryButton(
                            buttonTitle: 'REGISTRACIJA',
                            onPress: () => toggleSignUp(true),
                          )
                      ],
                    ),
                  ),
                  HigLoginLogo(isSignUp),
                  const SizedBox(height: 25)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> tryRegisterUser(AuthProvider authProvider) async {
    if (didClickLogin == false) {
      setState(() {
        didClickLogin = true;
      });
    }
    final bool isValid = _loginKey.currentState!.validate();
    if (isValid) {
      showDialog(
          context: context,
          builder: (context) {
            return const LoaderDialog();
          });
      try {
        await authProvider
            .registerUser(_email.text, _password.text, _username.text)
            .whenComplete(() {
          // if (mounted) {
          //Navigator.of(context, rootNavigator: true).pop();
          // }
          //Navigator.pop(context);
        });
      } on FirebaseAuthException catch (error) {
        log(error.message!);
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => QuizErrorDialog(error.message!),
        );
      }
    }
  }

  Future<void> tryLoginUser(AuthProvider authProvider) async {
    if (didClickLogin == false) {
      setState(() {
        didClickLogin = true;
      });
    }
    final bool isValid = _loginKey.currentState!.validate();
    if (isValid) {
      showDialog(
          context: context,
          builder: (context) {
            return const LoaderDialog();
          });
      try {
        await authProvider
            .loginUser(_email.text, _password.text)
            .whenComplete(() {
          // Navigator.of(context, rootNavigator: true).pop();

          //Navigator.pop(context);
        });
      } on FirebaseAuthException catch (error) {
        log(error.message!);
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => QuizErrorDialog(error.message!),
        );
      }
    }
  }

  Widget _buildEmailField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: CustomTextField(
        controller: _email,
        hint: "Email",
        validation: (email) {
          if (email!.isEmpty) {
            return "Molimo popunite prazno polje";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildUsernameField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: CustomTextField(
        hint: "Username",
        controller: _username,
        onChange: didClickLogin
            ? (promjena) {
                _loginKey.currentState!.validate();
                return null;
              }
            : null,
        validation: (username) {
          if (username!.length < 3) {
            return "Username mora imati minimalno 3 znaka";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
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
    );
  }

  Widget _buildConfirmPasswordField() {
    return Container(
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
    );
  }

  EdgeInsets signUpBodyPadding = const EdgeInsets.only(
    top: 90,
    right: 25,
    left: 25,
  );
}

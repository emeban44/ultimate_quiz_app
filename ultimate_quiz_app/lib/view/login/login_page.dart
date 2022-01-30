import 'package:flutter/material.dart';
import 'package:ultimate_quiz_app/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
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
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          //extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 25,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Ko ne zna, znat ce poslije!",
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
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: "Email Drogba",
                        ),
                        CustomTextField(
                          hint: "Username",
                        ),
                        CustomTextField(
                          hint: "Password",
                        ),
                        CustomTextField(
                          hint: "Confirm Password",
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('LOGIN'),
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                          ),
                        ),
                        TextButton(onPressed: () {}, child: Text("SIGN UP"))
                      ],
                    ),
                  ),
                  const SizedBox(
                      //height: 300,
                      )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          //extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
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
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextField(
                            hint: "Email",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextField(
                            hint: "Username",
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextField(
                            hint: "Password",
                            isObscure: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextField(
                            hint: "Confirm Password",
                            isObscure: true,
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
                            onPressed: () {},
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
                          margin: const EdgeInsets.only(top: 16),
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

import 'package:enjoyce/components/box_icon_button.dart';
import 'package:enjoyce/components/circles_background.dart';
import 'package:enjoyce/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CirclesBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  // Logo
                  Hero(
                    tag: "logo",
                    child: Image.asset(
                      'lib/assets/enjoyce_logo.png',
                      width: 171,
                      height: 163,
                    ),
                  ),
                  const SizedBox(height: 13),

                  // Header
                  const Text(
                    "Welcome onboard, travelers!",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),

                  // Subheader
                  const Text(
                    "Log in to your account",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Kanit',
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Email Entry
                  const CustomTextField(
                    label: "E-mail",
                    hintText: "Enter your e-mail",
                    isPasswordField: false,
                  ),
                  const SizedBox(height: 20),

                  // Password Entry
                  const CustomTextField(
                    label: "Password",
                    hintText: "Enter your password",
                    isPasswordField: true,
                  ),
                  const SizedBox(height: 20),

                  // Log In Button
                  SizedBox(
                    width: 380,
                    height: 50,
                    child: TextButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.lightBlue),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        print("Log-in button pressed!");
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Kanit",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Forgot Password
                  const Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // "Or Sign In" With Div
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(43, 154, 216, 1),
                            thickness: 1,
                            height: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Or Sign In With",
                            style: TextStyle(
                                color: Color.fromRGBO(43, 154, 216, 1),
                                fontSize: 11,
                                fontFamily: "Kanit",
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(43, 154, 216, 1),
                            thickness: 1,
                            height: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Button Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoxIconButton(
                          icon: Image.asset("lib/assets/facebook_logo.png")),
                      const SizedBox(width: 10),
                      BoxIconButton(
                          icon: Image.asset("lib/assets/google_logo.png")),
                      const SizedBox(width: 10),
                      BoxIconButton(
                          icon: Image.asset("lib/assets/apple_logo.png")),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // Create an Account
                  Container(
                    width: 380,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                        border: Border.all(
                      color: Colors.lightBlue,
                    )),
                    child: TextButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        foregroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {
                        print("Create an Account button pressed!");
                      }, //onPressed
                      child: const Text(
                        "Create an Account",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

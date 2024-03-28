import 'package:enjoyce/components/box_icon_button.dart';
import 'package:enjoyce/components/circles_background.dart';
import 'package:enjoyce/components/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final signupFormKey = GlobalKey<FormState>();
bool invalidCredentials = false;

class SigninPage extends StatefulWidget {
  SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  void createAccount() async {
    // Loading Circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlue,
            ),
          );
        });

    await FirebaseAuth.instance
        // Sign Up
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        // Pop loading circle
        .then((value) => Navigator.pop(context));

    // Exit out of sign up screen
    Navigator.pop(context);
  }

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
                  Image.asset(
                    'lib/assets/enjoyce_logo.png',
                    width: 171,
                    height: 163,
                  ),
                  const SizedBox(height: 13),

                  // Text Fields
                  SignupForm(
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
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
                            "Or Sign Up With",
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
                  const SizedBox(height: 70),

                  // Sign Up Button
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
                        if (signupFormKey.currentState!.validate()) {
                          createAccount();
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Kanit",
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

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class VisibilityState extends ChangeNotifier {
  var visibility = false;

  void toggleVisibility() {
    visibility = !visibility;
    notifyListeners();
  }
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VisibilityState(),
      child: Form(
        key: signupFormKey,
        child: Column(
          children: [
            // Email Entry
            CustomTextField(
              label: "E-mail",
              hintText: "Enter your e-mail",
              isPasswordField: false,
              isConfirmPasswordField: false,
              controller: widget.emailController,
              validator: (email) {
                final RegExp emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'); // Regular expression for email validation
                if (!emailRegex.hasMatch(email ?? '')) {
                  return 'Please enter a valid e-mail';
                }
                if (invalidCredentials) {
                  return 'Invalid credentials';
                }
                return null;
              },
              onChanged: () {
                invalidCredentials = false;
              },
            ),
            const SizedBox(height: 20),
            // Password Entry
            CustomTextField(
              label: "Password",
              hintText: "Enter your password",
              isPasswordField: true,
              isConfirmPasswordField: false,
              controller: widget.passwordController,
              validator: (password) {
                final digitRegex = RegExp(r'\d');
                final alphaRegex = RegExp(r'[a-zA-Z]');

                if (password == null || password.isEmpty) {
                  return 'Password field must not be empty';
                }
                if (password.length < 6) {
                  return 'Password must be 6 characters or longer';
                }
                if (!digitRegex.hasMatch(password)) {
                  return 'Password must contain numbers';
                }
                if (!alphaRegex.hasMatch(password)) {
                  return 'Password must contain letters';
                }
                if (widget.passwordController.text !=
                    widget.confirmPasswordController.text) {
                  return 'Passwords must match';
                }
                if (invalidCredentials) {
                  return 'Invalid credentials';
                }
                return null;
              },
              onChanged: () {
                invalidCredentials = false;
              },
            ),
            const SizedBox(height: 20),
            // Confirm Password Entry
            CustomTextField(
              label: "Confirm Password",
              hintText: "Enter your password again",
              isPasswordField: true,
              isConfirmPasswordField: true,
              controller: widget.confirmPasswordController,
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return 'Password field must not be empty';
                }
                if (invalidCredentials) {
                  return 'Invalid credentials';
                }
                return null;
              },
              onChanged: () {
                invalidCredentials = false;
              },
            ),
          ],
        ),
      ),
    );
  }
}

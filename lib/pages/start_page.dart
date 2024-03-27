import 'package:enjoyce/components/circles_background.dart';
import 'package:enjoyce/pages/login_page.dart'; // Import LoginPage
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Simulating some loading time before navigating to the login page
    Future.delayed(Duration(seconds: 2), () {
      // Navigating to the LoginPage after 2 seconds
      Navigator.pushReplacementNamed(context, "/loginpage");
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CirclesBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 268, width: 54),
                  // Logo
                  Image.asset(
                    'lib/assets/enjoyce_logo.png',
                    width: 252,
                    height: 264,
                  ),
                  SizedBox(height: 100),

                  // Developed By:
                  Text(
                    "Developed By:",
                    style: TextStyle(
                      color: Color.fromRGBO(43, 154, 216, 1),
                      fontSize: 14,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Appetizer
                  Text(
                    "APPetizer",
                    style: TextStyle(
                      color: Color.fromRGBO(244, 115, 200, 1),
                      fontSize: 14,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

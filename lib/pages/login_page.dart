import 'package:enjoyce/components/circles_background.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CirclesBackground(
        child: Center(child: Text("hello world")),
      ),
    );
  }
}

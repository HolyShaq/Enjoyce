import 'package:enjoyce/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            
            // Homepage Page goes here
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("You are logged in"),
                    ElevatedButton(
                        onPressed: () {
                          signOut();
                        },
                        child: const Text("LogOut"))
                  ],
                ),
              ),
            );
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}

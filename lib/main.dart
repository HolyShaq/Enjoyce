import 'package:flutter/material.dart';
import 'package:enjoyce/pages/start_page.dart';
import 'pages/login_page.dart';

void main() {
  //it runs the app (MainApp)
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enjoyce Travel and Tours',
      home: const StartPage(),
      routes: {
        '/loginpage': (context) =>  const LoginPage(),
      },
    );
  }
}

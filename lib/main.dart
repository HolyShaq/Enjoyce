import 'package:flutter/material.dart';
import 'package:enjoyce/pages/start_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async { //it runs the app (MainApp)
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
      return const MaterialApp(
        title: 'Enjoyce Travel and Tours',
        home: StartPage(),
      );
  }
}


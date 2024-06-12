import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCSYF3Bfs9ebix7F0c2-IGkaPWK62UhyRU",
            authDomain: "enjoyce-wvoh32.firebaseapp.com",
            projectId: "enjoyce-wvoh32",
            storageBucket: "enjoyce-wvoh32.appspot.com",
            messagingSenderId: "635009791362",
            appId: "1:635009791362:web:105fc2593999d293e78b9b"));
  } else {
    await Firebase.initializeApp();
  }
}

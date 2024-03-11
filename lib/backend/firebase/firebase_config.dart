import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDKCu2djvRK8UCDkx9P1yGaf0CxM14NCW8",
            authDomain: "tahady.firebaseapp.com",
            projectId: "tahady",
            storageBucket: "tahady.appspot.com",
            messagingSenderId: "349812889695",
            appId: "1:349812889695:web:20b73471b0d79a5872e3ea",
            measurementId: "G-SLL10RN9Q1"));
  } else {
    await Firebase.initializeApp();
  }
}

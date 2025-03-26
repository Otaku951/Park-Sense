import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAmb3Y0ZaU8snEQrP5TDU3ZO2h11WeI8-c",
            authDomain: "parksense-53ba7.firebaseapp.com",
            projectId: "parksense-53ba7",
            storageBucket: "parksense-53ba7.firebasestorage.app",
            messagingSenderId: "1048598032252",
            appId: "1:1048598032252:web:7e95455ea826d4f6a23ef9",
            measurementId: "G-3H7PM5QQDF"));
  } else {
    await Firebase.initializeApp();
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_signin/pages/homeScreen.dart';
import 'package:firebase_login_signin/pages/signinSignupScreen.dart';
import 'package:firebase_login_signin/pages/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreenView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_signin/pages/signinSignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/loginController.dart';

class ChooseScreen extends StatelessWidget {
  ChooseScreen({super.key});

  final LoginRegisterPageController controller = Get.put(
    LoginRegisterPageController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.google,
            size: 80,
            color: Colors.green,
          ),
          const SizedBox(height: 70),
          const Center(child: Text('Let\'s you in')),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () async {
              try {
                controller.signInWithGoogle();
              } on FirebaseException catch (e) {
                Get.snackbar('Error', e.toString());
              }
            },
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        'assets/google.png',
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text('Google'),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text('or'),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Get.to(() => LoginRegisterPageView());
            },
            child: Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.green,
              ),
              child: const Center(
                  child: Text(
                'Sign in with your password',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
              onTap: () {
                controller.changeLoginValue();
                Get.to(() => LoginRegisterPageView());
              },
              child: const Text('Don\'t have an account? Sign up')),
        ],
      ),
    );
  }
}

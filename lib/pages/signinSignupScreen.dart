import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_signin/pages/chooseScreen.dart';
import 'package:firebase_login_signin/pages/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/loginController.dart';

class LoginRegisterPageView extends StatelessWidget {
  LoginRegisterPageView({super.key});

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final LoginRegisterPageController controller = Get.put(
    LoginRegisterPageController(),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  FontAwesomeIcons.google,
                  size: 80,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 70),
              Center(
                child: Text(
                  controller.isLogin.value == true
                      ? 'Sign in'
                      : 'Sign up for Free',
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Email'),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: 'email',
                    errorText: controller.isValidate.value
                        ? 'Tidak boleh kosong'
                        : null,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Password'),
              ),
              const SizedBox(height: 5),
              TextField(
                obscureText: true,
                controller: pass,
                decoration: InputDecoration(
                    hintText: 'password',
                    errorText: controller.isValidate.value
                        ? 'Tidak boleh kosong'
                        : null,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  if (email.text.isNotEmpty &&
                      pass.text.isNotEmpty &&
                      controller.isLogin.value == true) {
                    controller.signInWithMail(email.text, pass.text);
                  } else if (email.text.isNotEmpty &&
                      pass.text.isNotEmpty &&
                      controller.isLogin.value == false) {
                    controller.signUpWithMail(email.text, pass.text);
                    controller.changeLoginValue();
                    email.text = '';
                    pass.text = '';
                    Get.off(() => LoginRegisterPageView());
                  } else {
                    controller.isValidate.value = true;
                  }
                },
                child: Center(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.green,
                    ),
                    child: Center(
                        child: Text(
                      controller.isLogin.value == true ? 'Sign in' : 'Sign up',
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(child: const Text('or continue with')),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  try {
                    controller.signInWithGoogle();
                  } on PlatformException catch (e) {
                    Get.snackbar('Error', e.toString());
                  }
                },
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all(width: 0.1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/google.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                  onTap: () {
                    controller.changeLoginValue();
                    Get.to(() => LoginRegisterPageView());
                  },
                  child: Center(
                      child: Text(controller.isLogin.value == true
                          ? 'Don\'t have an account? Sign up'
                          : 'Already have an account? Sign in'))),
            ],
          ),
        ),
      ),
    );
  }
}

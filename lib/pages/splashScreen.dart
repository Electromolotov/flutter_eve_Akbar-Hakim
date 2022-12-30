import 'package:firebase_login_signin/controllers/splashController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  void initState() {
    super.initState();
    controller.navigateHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 400),
          builder: (BuildContext context, double val, Widget? child) {
            return Opacity(
              opacity: val,
              child: Padding(
                padding: EdgeInsets.only(top: val),
                child: child,
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                FontAwesomeIcons.google,
                size: 100,
                color: Colors.green,
              ),
              SizedBox(height: 100),
              Center(
                child: CircularProgressIndicator(color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}

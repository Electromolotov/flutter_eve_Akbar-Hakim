import 'package:firebase_login_signin/pages/chooseScreen.dart';
import 'package:firebase_login_signin/pages/homeScreen.dart';
import 'package:firebase_login_signin/pages/signinSignupScreen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  void navigateHomePage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString("displayName");

    await Future.delayed(
      const Duration(seconds: 5),
      () {
        prefs.getString("displayName") != null
            ? Get.to(() => HomeView())
            : Get.to(() => ChooseScreen());
      },
    );
  }
}

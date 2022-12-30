import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signin/pages/chooseScreen.dart';
import 'package:firebase_login_signin/pages/signinSignupScreen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  Rx<String> displayName = "".obs;

  @override
  void onInit() async {
    super.onInit();
    getName();
  }

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString("displayName");

    displayName.value = prefs.getString("displayName").toString();

    update();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("displayName");
    displayName.value = "";
    Get.to(ChooseScreen());
  }
}

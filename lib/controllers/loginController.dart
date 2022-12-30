import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signin/pages/homeScreen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRegisterPageController extends GetxController {
  String? displayName = "";
  Rx<bool> isLogin = true.obs;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    displayName = googleUser!.displayName;

    initSharePreferences(displayName.toString());

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(
          () => Get.to(const HomeView()),
        );
  }

  initSharePreferences(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("displayName", name);
  }

  changeLoginValue() {
    isLogin.value = !isLogin.value;
    update();
  }
}

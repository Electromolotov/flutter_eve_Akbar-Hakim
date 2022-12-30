import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_signin/pages/homeScreen.dart';
import 'package:firebase_login_signin/pages/signinSignupScreen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRegisterPageController extends GetxController {
  String? displayName = "";
  Rx<bool> isLogin = true.obs;
  Rx<bool> isValidate = false.obs;

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

  Future signUpWithMail(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: pwd);
      await Get.to(() => LoginRegisterPageView());

      return null;
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
    }
  }

  Future signInWithMail(String mail, String pwd) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: pwd);
      if (FirebaseAuth.instance.currentUser != null) {
        displayName = FirebaseAuth.instance.currentUser!.displayName;
        initSharePreferences(displayName.toString());
        Get.to(() => const HomeView());
      }
      return null;
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
    }
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

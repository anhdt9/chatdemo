import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vscanner/screens/unauth/login_view.dart';
import 'package:vscanner/utils/key.dart';
import 'package:vscanner/utils/utils.dart';

class AuthService extends GetxController{

  Future<Either<String, Unit>> signUpWithEmailPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        appPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        appPrint('The account already exists for that email.');
      }
      return left(e.code);
    } catch (e) {
      appPrint(e.toString());
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> signInWithEmailPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      saveUserInfo();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        appPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        appPrint('Wrong password provided for that user.');
      }
      return left(e.code);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      saveUserInfo();
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> signInWithFacebook() async {
    final AccessToken result = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    try {
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      saveUserInfo();
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> signInAnonymous() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      saveUserInfo();
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }

  void saveUserInfo() {
    final User user = FirebaseAuth.instance.currentUser;
    GetStorage().write(USER_INFO, user.toString());
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GetStorage().remove(USER_INFO);
    Get.offAll<dynamic>(LoginView());
  }

  Future<Either<String, Unit>> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
}

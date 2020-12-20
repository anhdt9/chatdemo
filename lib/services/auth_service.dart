import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vscanner/utils/key.dart';

class AuthService {

  Future<Either<String, Unit>> signUpWithEmailPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return left(e.code);
    } catch (e) {
      print(e);
      return left(e);
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
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
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
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
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
    final FacebookAuthCredential facebookAuthCredential =
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
    User user = FirebaseAuth.instance.currentUser;
    GetStorage().write(USER_INFO, user.toString());
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    GetStorage().remove(USER_INFO);
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/routes/routes.dart';
import 'package:vscanner/services/auth_service.dart';
import 'package:vscanner/utils/utils.dart';

class LoginController extends GetxController {

  TextEditingController emailEditCtrl = TextEditingController();
  TextEditingController pwdEditCtrl = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode pwdFocus = FocusNode();

  var emailError = ''.obs;
  var pwdError = ''.obs;
  var hidePwd = true.obs;

  final _authService = Get.find<AuthService>();

  bool isValidValues(String email, String password) {
    bool isValid = true;
    if (!GetUtils.isEmail(email)) {
      isValid = false;
      emailError.value = 'email_invalid'.tr;
    } else {
      emailError.value = '';
    }

    if (GetUtils.isNullOrBlank(password)) {
      isValid = false;
      pwdError.value = 'password_invalid'.tr;
    } else {
      pwdError.value = '';
    }
    return isValid;
  }

  Future<void> signInWithEmailPassword() async {
    if (!isValidValues(emailEditCtrl.text, pwdEditCtrl.text)) {
      return;
    }
    final resultSignIn = await _authService.signInWithEmailPassword(emailEditCtrl.text, pwdEditCtrl.text);
    resultSignIn.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign in with email success');
        Get.offNamedUntil(HOME, (route) => false);
      },
    );
  }

  Future<void> signInWithGoogle() async {
    final resultSignIn = await _authService.signInWithGoogle();
    resultSignIn.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign in with google success');
        Get.offNamedUntil(HOME, (route) => false);
      },
    );
  }

  Future<void> signInWithFacebook() async {
    final resultSignIn = await _authService.signInWithFacebook();
    resultSignIn.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign in with facebook success');
        Get.offNamedUntil(HOME, (route) => false);
      },
    );
  }

  Future<void> signInAnonymous() async {
    final resultSignIn = await _authService.signInAnonymous();
    resultSignIn.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign in with anonymous success');
        Get.offNamedUntil(HOME, (route) => false);
      },
    );
  }

  @override
  void onInit() {

  }

  @override
  void dispose() {
    emailEditCtrl.dispose();
    pwdEditCtrl.dispose();
    emailFocus.dispose();
    pwdFocus.dispose();
    super.dispose();
  }

  void checkEmailFocus(BuildContext context) {
    fieldFocusChange(context, emailFocus, pwdFocus);
  }

  void checkPwdFocus(BuildContext context) {
    fieldFocusChange(context, pwdFocus, null);
  }
}

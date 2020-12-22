import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/routes/routes.dart';
import 'package:vscanner/services/auth_service.dart';
import 'package:vscanner/utils/utils.dart';

class SignUpController extends GetxController {
  TextEditingController emailEditCtrl = TextEditingController();
  TextEditingController pwdEditCtrl = TextEditingController();
  TextEditingController pwd2EditCtrl = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode pwdFocus = FocusNode();
  FocusNode pwd2Focus = FocusNode();

  var emailError = ''.obs;
  var pwdError = ''.obs;
  var pwd2Error = ''.obs;
  var hidePwd = true.obs;
  var hidePwd2 = true.obs;

  bool isValidValues(String email, String password, String password2) {
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

    if (GetUtils.isNullOrBlank(password2)) {
      isValid = false;
      pwd2Error.value = 'password_invalid'.tr;
    } else {
      pwd2Error.value = '';
    }

    if (password != password2) {
      isValid = false;
      pwd2Error.value = 'password_not_match'.tr;
    } else {
      pwd2Error.value = '';
    }
    return isValid;
  }

  final _authService = Get.find<AuthService>();

  Future<void> signUpWithEmailPassword() async {
    if(!isValidValues(emailEditCtrl.text, pwdEditCtrl.text, pwd2EditCtrl.text, )){
      return;
    }
    final resultSignUp = await _authService.signUpWithEmailPassword(emailEditCtrl.text, pwdEditCtrl.text);
    resultSignUp.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sign up with email success');
        await 1.delay();
        Get.offNamedUntil(LOGIN, (route) => false);
      },
    );
  }


  void checkEmailFocus(BuildContext context) {
    fieldFocusChange(context, emailFocus, pwdFocus);
  }

  void checkPwdFocus(BuildContext context) {
    fieldFocusChange(context, pwdFocus, pwd2Focus);
  }

  void checkPwd2Focus(BuildContext context) {
    fieldFocusChange(context, pwd2Focus, null);
  }

  @override
  void dispose() {
    emailEditCtrl.dispose();
    pwdEditCtrl.dispose();
    pwd2EditCtrl.dispose();
    emailFocus.dispose();
    pwdFocus.dispose();
    pwd2Focus.dispose();
    super.dispose();
  }
}

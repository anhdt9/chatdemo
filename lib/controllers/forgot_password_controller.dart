import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/screens/unauth/login_view.dart';
import 'package:vscanner/services/auth_service.dart';
import 'package:vscanner/utils/utils.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailEditCtrl = TextEditingController();
  FocusNode emailFocus = FocusNode();
  var emailError = ''.obs;

  bool isValidValues(String email) {
    bool isValid = true;
    if (!GetUtils.isEmail(email)) {
      isValid = false;
      emailError.value = 'email_invalid'.tr;
    } else {
      emailError.value = '';
    }
    return isValid;
  }

  Future<void> resetPassword() async {
    if (!isValidValues(emailEditCtrl.text)) {
      return;
    }
    final _authService = Get.find<AuthService>();
    final result = await _authService.resetPassword(emailEditCtrl.text);

    result.fold(
      (error) async {
        showErrorSnackBar(error);
      },
      (unit) async {
        showSuccessSnackBar('Sent request password success!');
        await 1.delay();
        Get.offAll<dynamic>(LoginView());
      },
    );
  }

  void checkEmailFocus(BuildContext context) {
    fieldFocusChange(context, emailFocus, null);
  }
}

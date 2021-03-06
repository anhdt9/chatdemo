import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorSnackBar(String error) {
  Get.snackbar<dynamic>(
    'Error',
    error,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.red,
    backgroundColor: Colors.white,
  );
}

void showSuccessSnackBar(String message) {
  Get.snackbar<dynamic>(
    'Success',
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.blue,
    backgroundColor: Colors.white,
  );
}

void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  if (nextFocus != null) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  } else {
    currentFocus.unfocus();
  }
}

void appPrint(String msg){
  debugPrint('----- CHAT_DEMO -----' + msg);
}

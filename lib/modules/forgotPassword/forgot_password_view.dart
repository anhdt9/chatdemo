import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/forgotPassword/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('forgot'),
        ),
      ),
    );
  }
}

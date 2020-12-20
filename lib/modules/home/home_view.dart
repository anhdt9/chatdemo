import 'package:flutter/material.dart';
import 'package:vscanner/modules/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/login/login_controller.dart';
import 'package:vscanner/modules/login/login_view.dart';
import 'package:vscanner/modules/widgets/app_button.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return Scaffold(
      body: Container(
        child: Center(
          child: AppButton(
            text: 'logout'.tr,
            color: Colors.cyan,
            onPress: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              loginController.signOut();
              Get.offAll(LoginView());
            },
          ),
        ),
      ),
    );
  }
}

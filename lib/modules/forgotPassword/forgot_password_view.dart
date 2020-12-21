import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/forgotPassword/forgot_password_controller.dart';
import 'package:vscanner/modules/widgets/app_button.dart';
import 'package:vscanner/modules/widgets/scan_logo.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScanLogo(),
              Obx(() => TextFormField(
                controller: controller.emailEditCtrl,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.emailFocus,
                onFieldSubmitted: (_) =>
                    controller.checkEmailFocus(context),
                decoration: InputDecoration(
                    errorText: GetUtils.isNullOrBlank(controller.emailError.value)
                        ? null
                        : controller.emailError.value,
                    labelText: 'Email',
                    hintText: 'enter_email'.tr,
                    border: buildOutlineInputBorder()),
              )),
              SizedBox(height: 20),
              AppButton(
                text: 'reset_password'.tr,
                color: Colors.cyan,
                onPress: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  controller.resetPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withAlpha(50), width: 0),
        borderRadius: const BorderRadius.all(
          Radius.circular(19),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/controllers/forgot_password_controller.dart';
import 'package:vscanner/widgets/app_button.dart';
import 'package:vscanner/widgets/scan_logo.dart';
import 'package:vscanner/widgets/styles.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {

  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 20),
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
}

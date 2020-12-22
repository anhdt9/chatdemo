import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/controllers/signup_controller.dart';
import 'package:vscanner/widgets/app_button.dart';
import 'package:vscanner/widgets/scan_logo.dart';
import 'package:vscanner/widgets/styles.dart';

class SignUpView extends GetView<SignUpController> {

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const ScanLogo(),
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
              Obx(() => TextFormField(
                obscureText: controller.hidePwd.value,
                controller: controller.pwdEditCtrl,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.pwdFocus,
                onFieldSubmitted: (_) => controller.checkPwdFocus(context),
                decoration: InputDecoration(
//                        icon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(controller.hidePwd.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.hidePwd.value =
                          !controller.hidePwd.value;
                        }),
                    errorText: GetUtils.isNullOrBlank(controller.pwdError.value)
                        ? null
                        : controller.pwdError.value,
                    labelText: 'password'.tr,
                    hintText: 'enter_password'.tr,
                    border: buildOutlineInputBorder()),
              )),
              const SizedBox(height: 20),
              Obx(() => TextFormField(
                obscureText: controller.hidePwd2.value,
                controller: controller.pwd2EditCtrl,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.pwd2Focus,
                onFieldSubmitted: (_) => controller.checkPwd2Focus(context),
                decoration: InputDecoration(
//                        icon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(controller.hidePwd2.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.hidePwd2.value =
                          !controller.hidePwd2.value;
                        }),
                    errorText: GetUtils.isNullOrBlank(controller.pwd2Error.value)
                        ? null
                        : controller.pwd2Error.value,
                    labelText: 'password'.tr,
                    hintText: 'enter_password'.tr,
                    border: buildOutlineInputBorder()),
              )),
              const SizedBox(height: 10),
              AppButton(
                text: 'sign_up'.tr,
                color: Colors.cyan,
                onPress: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  controller.signUpWithEmailPassword();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

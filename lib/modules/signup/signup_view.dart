import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/signup/signup_controller.dart';
import 'package:vscanner/modules/widgets/app_button.dart';
import 'package:vscanner/modules/widgets/scan_logo.dart';

class SignUpView extends GetView<SignUpController> {
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
              SizedBox(height: 20),
              Obx(() => TextFormField(
                obscureText: controller.showPwd.value,
                controller: controller.pwdEditCtrl,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.pwdFocus,
                onFieldSubmitted: (_) => controller.checkPwdFocus(context),
                decoration: InputDecoration(
//                        icon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(controller.showPwd.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.showPwd.value =
                          !controller.showPwd.value;
                        }),
                    errorText: GetUtils.isNullOrBlank(controller.pwdError.value)
                        ? null
                        : controller.pwdError.value,
                    labelText: 'password'.tr,
                    hintText: 'enter_password'.tr,
                    border: buildOutlineInputBorder()),
              )),
              SizedBox(height: 20),
              Obx(() => TextFormField(
                obscureText: controller.showPwd2.value,
                controller: controller.pwd2EditCtrl,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.pwd2Focus,
                onFieldSubmitted: (_) => controller.checkPwd2Focus(context),
                decoration: InputDecoration(
//                        icon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(controller.showPwd2.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          controller.showPwd2.value =
                          !controller.showPwd2.value;
                        }),
                    errorText: GetUtils.isNullOrBlank(controller.pwd2Error.value)
                        ? null
                        : controller.pwd2Error.value,
                    labelText: 'password'.tr,
                    hintText: 'enter_password'.tr,
                    border: buildOutlineInputBorder()),
              )),
              SizedBox(height: 10),
              AppButton(
                text: 'sign_up'.tr,
                color: Colors.cyan,
                onPress: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  controller.signUpWithEmailPassword();
                },
              ),
              SizedBox(height: 20),
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

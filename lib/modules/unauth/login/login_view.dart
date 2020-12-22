import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/unauth/forgotPassword/forgot_password_controller.dart';
import 'package:vscanner/modules/unauth/forgotPassword/forgot_password_view.dart';
import 'package:vscanner/modules/unauth/login/login_controller.dart';
import 'package:vscanner/modules/unauth/signup/signup_controller.dart';
import 'package:vscanner/modules/unauth/signup/signup_view.dart';
import 'package:vscanner/modules/widgets/app_button.dart';
import 'package:vscanner/modules/widgets/scan_logo.dart';
import 'package:vscanner/modules/widgets/styles.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(ForgotPasswordController());

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
              const SizedBox(height: 10),
              AppButton(
                text: 'login'.tr,
                color: Colors.cyan,
                onPress: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  controller.signInWithEmailPassword();
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'have_not_acc'.tr,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: 'sign_up'.tr,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to<dynamic>(SignUpView()),
                          )
                        ]),
                  ),
                  GestureDetector(
                    onTap: () => Get.to<dynamic>(ForgotPasswordView()),
                    child: Text(
                      'forgot_pwd'.tr,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'connecting_with'.tr,
                  style: const TextStyle(color: Colors.black38, fontSize: 12),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: controller.signInWithFacebook,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/facebook.png"),
                      radius: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap:controller.signInWithGoogle,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/google.png"),
                      radius: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              AppButton(
                text: 'login_anonymous'.tr,
                color: Colors.grey,
                onPress: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  controller.signInAnonymous();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

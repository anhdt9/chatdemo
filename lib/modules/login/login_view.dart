import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/forgotPassword/forgot_password_controller.dart';
import 'package:vscanner/modules/forgotPassword/forgot_password_view.dart';
import 'package:vscanner/modules/login/login_controller.dart';
import 'package:vscanner/modules/signup/signup_controller.dart';
import 'package:vscanner/modules/signup/signup_view.dart';
import 'package:vscanner/modules/widgets/app_button.dart';
import 'package:vscanner/modules/widgets/scan_logo.dart';

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
              SizedBox(height: 10),
              AppButton(
                text: 'login'.tr,
                color: Colors.cyan,
                onPress: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  controller.signInWithEmailPassword();
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'have_not_acc'.tr,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: 'sign_up'.tr,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(SignUpView()),
                          )
                        ]),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(ForgotPasswordView()),
                    child: Text(
                      'forgot_pwd'.tr,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  'connecting_with'.tr,
                  style: TextStyle(color: Colors.black38, fontSize: 12),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: controller.signInWithFacebook,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/facebook.png"),
                      radius: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap:controller.signInWithGoogle,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/google.png"),
                      radius: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              AppButton(
                text: 'login_anonymous'.tr,
                color: Colors.grey,
                onPress: () async {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  controller.signInAnonymous();
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

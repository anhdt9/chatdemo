import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/utils/utils.dart';
import 'package:vscanner/widgets/app_button.dart';
import 'package:vscanner/widgets/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingController extends GetxController {
  var noti = false.obs;
  var pre_noti = true.obs;
  var vibrate = false.obs;
  var noti_led = false.obs;
  var sound = false.obs;

  var locale = const Locale('en', 'US').obs;

  TextEditingController pwdEditCtrl = TextEditingController();
  TextEditingController pwd1EditCtrl = TextEditingController();
  TextEditingController pwd2EditCtrl = TextEditingController();

  FocusNode pwdFocus = FocusNode();
  FocusNode pwd1Focus = FocusNode();
  FocusNode pwd2Focus = FocusNode();

  var pwdError = ''.obs;
  var pwd1Error = ''.obs;
  var pwd2Error = ''.obs;
  var hidePwd = true.obs;
  var hidePwd1 = true.obs;
  var hidePwd2 = true.obs;

  void changePassword() {
    final List<Widget> _child = [
      ListTile(
        title: Obx(() => TextFormField(
          obscureText: hidePwd.value,
          controller: pwdEditCtrl,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focusNode: pwdFocus,
          onFieldSubmitted: (_) =>
              fieldFocusChange(Get.context, pwdFocus, pwd1Focus),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(hidePwd.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    hidePwd.value = !hidePwd.value;
                  }),
              errorText: GetUtils.isNullOrBlank(pwdError.value)
                  ? null
                  : pwdError.value,
              labelText: 'curr_password'.tr,
              hintText: 'curr_password'.tr,
              border: buildOutlineInputBorder()),
        )),
      ),
      ListTile(
        title: Obx(() => TextFormField(
          obscureText: hidePwd1.value,
          controller: pwd1EditCtrl,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focusNode: pwd1Focus,
          onFieldSubmitted: (_) =>
              fieldFocusChange(Get.context, pwd1Focus, pwd2Focus),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(hidePwd1.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    hidePwd1.value = !hidePwd1.value;
                  }),
              errorText: GetUtils.isNullOrBlank(pwd1Error.value)
                  ? null
                  : pwd1Error.value,
              labelText: 'new_password'.tr,
              hintText: 'new_password'.tr,
              border: buildOutlineInputBorder()),
        )),
      ),
      ListTile(
        title: Obx(() => TextFormField(
          obscureText: hidePwd2.value,
          controller: pwd2EditCtrl,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          focusNode: pwd2Focus,
          onFieldSubmitted: (_) =>
              fieldFocusChange(Get.context, pwd2Focus, null),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(hidePwd2.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    hidePwd2.value = !hidePwd2.value;
                  }),
              errorText: GetUtils.isNullOrBlank(pwd2Error.value)
                  ? null
                  : pwd2Error.value,
              labelText: 'confirm_new_password'.tr,
              hintText: 'confirm_new_password'.tr,
              border: buildOutlineInputBorder()),
        )),
      ),
    ];

    Get.defaultDialog<dynamic>(
        title: 'change_password'.tr,
        content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _child[index])),
        actions: [
          AppButton(
              text: 'cancel'.tr,
              onPress: () async {
                appPrint('cancel');
              },
              color: Colors.cyan),
          AppButton(
              text: 'ok'.tr,
              onPress: () async {
                appPrint('ok');
              },
              color: Colors.cyan)
        ]);
  }
}
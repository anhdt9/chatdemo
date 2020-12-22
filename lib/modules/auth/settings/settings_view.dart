import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/auth/settings/settings_controller.dart';
import 'package:vscanner/modules/widgets/app_button.dart';
import 'package:vscanner/modules/widgets/section_with_title.dart';
import 'package:vscanner/services/auth_service.dart';
import 'package:vscanner/utils/key.dart';
import 'package:get_storage/get_storage.dart';

class SettingView extends GetView<SettingController> {
  final AuthService _authService = Get.find<AuthService>();
  final SettingController _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 25),
        child: Container(
          child: Column(
            children: [
              SectionWithTitle(
                  title: 'your_profile'.tr,
                  child: ListView(
                    semanticChildCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: ListTile.divideTiles(context: context, tiles: [
                      Obx(() => SwitchListTile(
                          title: Text('notification'.tr),
                          value: _settingController.noti.value,
                          onChanged: (changed) => _settingController
                              .noti.value = !_settingController.noti.value)),
                      Obx(() => SwitchListTile(
                          title: Text('preview_notification'.tr),
                          value: _settingController.pre_noti.value,
                          onChanged: (changed) => _settingController.pre_noti
                              .value = !_settingController.pre_noti.value)),
                    ]).toList(),
                  )),
              SectionWithTitle(
                  title: 'sound_and_notification'.tr,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    semanticChildCount: 5,
                    shrinkWrap: true,
                    children: ListTile.divideTiles(context: context, tiles: [
                      Obx(() => SwitchListTile(
                          title: Text('notification'.tr),
                          value: _settingController.noti.value,
                          onChanged: (changed) => _settingController
                              .noti.value = !_settingController.noti.value)),
                      Obx(() => SwitchListTile(
                          title: Text('preview_notification'.tr),
                          value: _settingController.pre_noti.value,
                          onChanged: (changed) => _settingController.pre_noti
                              .value = !_settingController.pre_noti.value)),
                      Obx(() => SwitchListTile(
                          title: Text('notification_vibrate'.tr),
                          value: _settingController.vibrate.value,
                          onChanged: (changed) => _settingController.vibrate
                              .value = !_settingController.vibrate.value)),
                      Obx(() => SwitchListTile(
                          title: Text('notification_led'.tr),
                          value: _settingController.noti_led.value,
                          onChanged: (changed) => _settingController.noti_led
                              .value = !_settingController.noti_led.value)),
                      Obx(() => SwitchListTile(
                          title: Text('sound'.tr),
                          value: _settingController.sound.value,
                          onChanged: (changed) => _settingController
                              .sound.value = !_settingController.sound.value))
                    ]).toList(),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('language'.tr, style: const TextStyle(fontSize: 16)),
                  CupertinoSegmentedControl(
                    groupValue: controller.locale.value,
                    children: {
                      const Locale('vi', 'VN'): Container(
                          padding: const EdgeInsets.all(6),
                          child: Row(children: [
                            Image.asset(
                              'assets/flag-vi.png',
                              width: 24,
                              height: 18,
                            ),
                            const Text('Vi')
                          ])),
                      const Locale('en', 'US'): Container(
                        padding: const EdgeInsets.all(6),
                        child: Row(children: [
                          Image.asset(
                            'assets/flag-en.png',
                            width: 24,
                            height: 18,
                          ),
                          const Text('En'),
                        ]),
                      )
                    },
                    onValueChanged: (Locale locale) {
                      controller.locale.value = locale;
                      GetStorage()
                          .write(LANGUAGE_LANGUAGECODE, locale.languageCode);
                      Get.updateLocale(locale);
                    },
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton(
                    text: 'logout'.tr,
                    color: Colors.cyan,
                    onPress: () => {_authService.signOut()},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

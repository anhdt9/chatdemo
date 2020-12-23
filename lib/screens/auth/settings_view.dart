import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vscanner/controllers/settings_controller.dart';
import 'package:vscanner/services/auth_service.dart';
import 'package:vscanner/utils/key.dart';
import 'package:vscanner/utils/utils.dart';
import 'package:vscanner/widgets/app_button.dart';
import 'package:vscanner/widgets/section_with_title.dart';

class SettingView extends GetView<SettingController> {
  const SettingView();

  @override
  Widget build(BuildContext context) {
    appPrint('---  SettingView  building ---');

    final SettingController controller = Get.put(SettingController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding:
            const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 25),
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
                          value: controller.noti.value,
                          onChanged: (changed) =>
                              controller.noti.value = !controller.noti.value)),
                      Obx(() => SwitchListTile(
                          title: Text('preview_notification'.tr),
                          value: controller.pre_noti.value,
                          onChanged: (changed) => controller.pre_noti.value =
                              !controller.pre_noti.value)),
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
                          value: controller.noti.value,
                          onChanged: (changed) =>
                              controller.noti.value = !controller.noti.value)),
                      Obx(() => SwitchListTile(
                          title: Text('preview_notification'.tr),
                          value: controller.pre_noti.value,
                          onChanged: (changed) => controller.pre_noti.value =
                              !controller.pre_noti.value)),
                      Obx(() => SwitchListTile(
                          title: Text('notification_vibrate'.tr),
                          value: controller.vibrate.value,
                          onChanged: (changed) => controller.vibrate.value =
                              !controller.vibrate.value)),
                      Obx(() => SwitchListTile(
                          title: Text('notification_led'.tr),
                          value: controller.noti_led.value,
                          onChanged: (changed) => controller.noti_led.value =
                              !controller.noti_led.value)),
                      Obx(() => SwitchListTile(
                          title: Text('sound'.tr),
                          value: controller.sound.value,
                          onChanged: (changed) =>
                              controller.sound.value = !controller.sound.value)),
                      ListTile(title: Text('change_password'.tr), onTap: controller.changePassword,)
                    ]).toList(),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('language'.tr, style: const TextStyle(fontSize: 16)),
                  CupertinoSegmentedControl<Locale>(
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
                    onPress: () => {Get.find<AuthService>().signOut()},
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

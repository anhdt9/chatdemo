import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/auth/findFriend/find_friend_view.dart';
import 'package:vscanner/modules/auth/home/home_controller.dart';
import 'package:vscanner/modules/auth/message/message_view.dart';
import 'package:vscanner/modules/auth/settings/settings_view.dart';
import 'package:vscanner/modules/widgets/styles.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _children[controller.index.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: 'message'.tr,
                icon: bottomNavigationBarIemIcon(
                    Icons.message, controller.smsNotification),
              ),
              BottomNavigationBarItem(
                  icon: bottomNavigationBarIemIcon(
                      Icons.people, controller.friendNotification),
                  label: 'find_friend'.tr),
              BottomNavigationBarItem(
                  icon: bottomNavigationBarIemIcon(
                      Icons.settings, controller.settingNotification),
                  label: 'setting'.tr),
            ],
            currentIndex: controller.index.value,
            onTap: (index) => controller.index.value = index,
          )),
    );
  }

  final List<Widget> _children = [
    MessageView(),
    FindFriendView(),
    SettingView(),
  ];
}

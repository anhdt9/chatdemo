import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/controllers/home_controller.dart';
import 'package:vscanner/screens/auth/find_friend_view.dart';
import 'package:vscanner/screens/auth/message_view.dart';
import 'package:vscanner/screens/auth/settings_view.dart';
import 'package:vscanner/widgets/styles.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(() => _child[controller.index.value]),
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

  final List<Widget> _child = [
    const MessageView(),
    const FindFriendView(),
    const SettingView()
  ];
}

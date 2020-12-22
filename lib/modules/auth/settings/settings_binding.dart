import 'package:get/get.dart';
import 'package:vscanner/modules/auth/settings/settings_controller.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }

}
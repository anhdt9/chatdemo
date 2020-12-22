import 'dart:ui';

import 'package:get/get.dart';

class SettingController extends GetxController{

  var noti = false.obs;
  var pre_noti = true.obs;
  var vibrate = false.obs;
  var noti_led = false.obs;
  var sound = false.obs;

  var locale = Locale('en', 'US').obs;
}
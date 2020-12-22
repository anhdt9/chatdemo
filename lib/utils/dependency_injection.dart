import 'package:get/get.dart';
import 'package:vscanner/modules/auth/home/home_controller.dart';
import 'package:vscanner/modules/unauth/login/login_controller.dart';
import 'package:vscanner/services/auth_service.dart';

class DependencyInjection {

  static void init(){
    Get.put(AuthService());
    Get.put(LoginController());
    Get.put(HomeController());
  }

}
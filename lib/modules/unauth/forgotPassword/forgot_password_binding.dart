import 'package:get/get.dart';
import 'package:vscanner/modules/unauth/forgotPassword/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }

}
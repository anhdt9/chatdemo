import 'package:get/get.dart';
import 'package:vscanner/modules/unauth/signup/signup_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }

}
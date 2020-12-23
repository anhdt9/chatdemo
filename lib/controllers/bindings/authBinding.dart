import 'package:get/get.dart';
import 'package:vscanner/services/auth_service.dart';
import 'package:vscanner/utils/utils.dart';

class AuthBinding extends Bindings {

  AuthBinding(){
    Get.put<AuthService>(AuthService(), permanent: true);
  }

  @override
  void dependencies() {
//    Get.put<AuthService>(AuthService(), permanent: true);
  }
}

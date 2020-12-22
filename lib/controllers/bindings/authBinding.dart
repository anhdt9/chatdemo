import 'package:get/get.dart';
import 'package:vscanner/services/auth_service.dart';

class AuthBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<AuthService>(AuthService(), permanent: true);
  }
}

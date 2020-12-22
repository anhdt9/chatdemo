import 'package:get/get.dart';
import 'package:vscanner/modules/auth/message/message_controller.dart';

class MessageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }

}
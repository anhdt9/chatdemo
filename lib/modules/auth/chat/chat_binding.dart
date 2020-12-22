import 'package:get/get.dart';
import 'package:vscanner/modules/auth/chat/chat_controller.dart';

class ChatBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }

}
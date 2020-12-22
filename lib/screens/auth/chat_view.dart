import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView();
  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());
    return Scaffold(
      body: Center(
        child: Text('Chat'),
      ),
    );
  }
}

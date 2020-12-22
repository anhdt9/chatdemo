import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/auth/chat/chat_controller.dart';

class ChatView extends GetView<ChatController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Chat'),
      ),
    );
  }

}
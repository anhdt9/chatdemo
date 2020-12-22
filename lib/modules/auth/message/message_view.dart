import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/auth/message/message_controller.dart';

class MessageView extends GetView<MessageController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Message'),
      ),
    );
  }

}
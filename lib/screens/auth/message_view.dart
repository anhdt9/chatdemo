import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/controllers/message_controller.dart';
import 'package:vscanner/utils/utils.dart';

class MessageView extends GetView<MessageController>{
  const MessageView();
  @override
  Widget build(BuildContext context) {
    appPrint('---  MessageView  building ---');

    final MessageController controller = Get.put(MessageController());


    return const Scaffold(
      body: Center(
        child: Text('Message'),
      ),
    );
  }

}
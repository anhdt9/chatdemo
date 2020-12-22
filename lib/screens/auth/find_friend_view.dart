import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/controllers/find_friend_controller.dart';
import 'package:vscanner/utils/utils.dart';

class FindFriendView extends GetView<FindFriendController>{
  const FindFriendView();
  @override
  Widget build(BuildContext context) {
    appPrint('---  FindFriendView  building ---');

    final FindFriendController controller = Get.put(FindFriendController());

    return const Scaffold(
      body: Center(
        child: Text('FindFriend'),
      ),
    );
  }

}
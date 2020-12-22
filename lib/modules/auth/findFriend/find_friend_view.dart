import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/auth/findFriend/find_friend_controller.dart';

class FindFriendView extends GetView<FindFriendController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('FindFriend'),
      ),
    );
  }

}
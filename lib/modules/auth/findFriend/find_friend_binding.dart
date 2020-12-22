import 'package:get/get.dart';
import 'package:vscanner/modules/auth/findFriend/find_friend_controller.dart';

class FindFriendBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FindFriendController());
  }

}
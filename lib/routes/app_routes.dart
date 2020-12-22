import 'package:vscanner/modules/auth/chat/chat_binding.dart';
import 'package:vscanner/modules/auth/chat/chat_view.dart';
import 'package:vscanner/modules/auth/findFriend/find_friend_binding.dart';
import 'package:vscanner/modules/auth/findFriend/find_friend_view.dart';
import 'package:vscanner/modules/auth/home/home_binding.dart';
import 'package:vscanner/modules/auth/home/home_view.dart';
import 'package:vscanner/modules/auth/message/message_binding.dart';
import 'package:vscanner/modules/auth/message/message_view.dart';
import 'package:vscanner/modules/auth/settings/settings_binding.dart';
import 'package:vscanner/modules/auth/settings/settings_view.dart';
import 'package:vscanner/modules/unauth/forgotPassword/forgot_password_binding.dart';
import 'package:vscanner/modules/unauth/forgotPassword/forgot_password_view.dart';
import 'package:vscanner/modules/unauth/login/login_binding.dart';
import 'package:vscanner/modules/unauth/login/login_view.dart';
import 'package:vscanner/modules/unauth/signup/signup_binding.dart';
import 'package:vscanner/modules/unauth/signup/signup_view.dart';
import 'package:vscanner/routes/routes.dart';
import 'package:get/get.dart';

class AppRouters {
  static final routes = [
    GetPage(
      name: HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: MESSAGE,
      page: () => MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: FIND_FRIEND,
      page: () => FindFriendView(),
      binding: FindFriendBinding(),
    ),
    GetPage(
      name: SETTINGS,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
  ];
}

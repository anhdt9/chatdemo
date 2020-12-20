import 'package:vscanner/modules/forgotPassword/forgot_password_binding.dart';
import 'package:vscanner/modules/forgotPassword/forgot_password_view.dart';
import 'package:vscanner/modules/home/home_binding.dart';
import 'package:vscanner/modules/home/home_view.dart';
import 'package:vscanner/modules/login/login_binding.dart';
import 'package:vscanner/modules/login/login_view.dart';
import 'package:vscanner/modules/signup/signup_binding.dart';
import 'package:vscanner/modules/signup/signup_view.dart';
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
  ];
}
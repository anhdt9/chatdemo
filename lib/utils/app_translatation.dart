import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'Card Scanner',
          'login': 'Login',
          'login_anonymous': 'Login anonymous',
          'sign_up': ' Sign up',
          'logout': 'Logout',
          'enter_email' : 'Enter email',
          'enter_password' : 'Enter password',
          'password': 'Password',
          'password_not_match' : 'Password not match',
          'email_invalid': 'Email invalid!',
          'pwd_invalid': 'Password invalid!',
          'have_not_acc': 'New user?',
          'forgot_pwd' : 'Forgot password?',
          'connecting_with' : '----- Or connecting with -----'
        },
        'vi_VN': {
          'title': 'Quét Card',
          'login': 'Đăng nhập',
          'login_anonymous': 'Đăng nhập ẩn danh',
          'sign_up': ' Đăng ký',
          'logout': 'Đăng xuất',
          'enter_email' : 'Nhập email',
          'enter_password' : 'Nhập mật khẩu',
          'password': 'Mật khẩu',
          'password_not_match' : 'Mật khẩu không khớp',
          'email_invalid': 'Email sai!',
          'pwd_invalid': 'Password sai!',
          'have_not_acc': 'Người mới',
          'forgot_pwd' : 'Quên mật khẩu?',
          'connecting_with' : '----- Hoặc liên kết tài khoản -----'
        }
      };
}

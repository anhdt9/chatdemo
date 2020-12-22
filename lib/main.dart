import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vscanner/controllers/bindings/authBinding.dart';
import 'package:vscanner/screens/auth/home_view.dart';
import 'package:vscanner/screens/unauth/login_view.dart';
import 'package:vscanner/utils/app_translatation.dart';
import 'package:vscanner/utils/key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await SystemChrome.setEnabledSystemUIOverlays([]);

  final String lang = GetStorage().read(LANGUAGE_LANGUAGECODE);
  final String user = GetStorage().read<String>(USER_INFO);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    translations: AppTranslations(),
    title: 'VScanner',
    locale: (!GetUtils.isNull(lang) && lang == 'en')
        ? const Locale('en', 'US')
        : const Locale('vi', 'VN'),
    initialBinding: AuthBinding(),
    home: GetUtils.isNullOrBlank(user) ? LoginView() : HomeView(),
  ));
}

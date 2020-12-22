import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vscanner/modules/auth/home/home_binding.dart';
import 'package:vscanner/modules/unauth/login/login_binding.dart';
import 'package:vscanner/routes/app_routes.dart';
import 'package:vscanner/routes/routes.dart';
import 'package:vscanner/utils/app_translatation.dart';
import 'package:vscanner/utils/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vscanner/utils/key.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  DependencyInjection.init();

  final user = GetStorage().read(USER_INFO);
  final lang = GetStorage().read(LANGUAGE_LANGUAGECODE);
  debugPrint('lang = ' + lang);

  runApp(GetMaterialApp(
    translations: AppTranslations(),
    title: 'VScanner',
    initialRoute: GetUtils.isNull(user) ? LOGIN : HOME,
    initialBinding: GetUtils.isNull(user) ? LoginBinding() : HomeBinding(),
    locale: lang == 'en' ? Locale('en', 'US') : Locale('vi', 'VN'),
    debugShowCheckedModeBanner: false,
    getPages: AppRouters.routes,
  ));
}

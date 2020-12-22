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

  final String user = GetStorage().read(USER_INFO);
  final String lang = GetStorage().read(LANGUAGE_LANGUAGECODE);

  runApp(GetMaterialApp(
    showPerformanceOverlay: true,
    translations: AppTranslations(),
    title: 'VScanner',
    initialRoute: GetUtils.isNull(user) ? LOGIN : HOME,
    initialBinding: GetUtils.isNull(user) ? LoginBinding() : HomeBinding(),
    locale: (!GetUtils.isNull(lang) && lang == 'en') ? Locale('en', 'US') : Locale('vi', 'VN'),
    debugShowCheckedModeBanner: false,
    getPages: routes,
  ));
}

import 'package:get/get.dart';
import 'package:vscanner/utils/lang/en.dart';
import 'package:vscanner/utils/lang/vi.dart';

class AppTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };
}

import 'package:epaypodcoderwithgetx/app/classes/GetStorageKeys.dart';
import 'package:epaypodcoderwithgetx/app/lang/app_translations.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final _getStorage = GetStorage();
  bool isDarkMode = _getStorage.read(GetStorageKeys.IS_DARK_MODE) ?? false;
  _getStorage.write(GetStorageKeys.IS_DARK_MODE, isDarkMode);
  String locl = _getStorage.read(GetStorageKeys.LANG) ?? 'az';

  runApp(
    GetMaterialApp(
      title: "ePay",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.AUTH,
      getPages: AppPages.routes,
      enableLog: true,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Duration(milliseconds: 300),
      translationsKeys: AppTranslation.translations,
      locale: Locale(locl.toString(), locl.toString().toUpperCase()),
      
    ),
  );
}

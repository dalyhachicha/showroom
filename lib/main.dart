import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/services/language_service.dart';
import 'app/data/utils/languages/strings.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      // General
      title: "Application",
      debugShowCheckedModeBanner: false,
      // Translations Section
      translations: Strings(),
      locale: LanguageService().loadLanguage(),
      fallbackLocale: Locale('en', 'US'),
      // Routes
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

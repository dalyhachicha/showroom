import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/services/language_service.dart';
import 'app/data/services/theme_service.dart';
import 'app/data/theme/app_theme.dart';
import 'app/data/utils/languages/strings.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      // General
      title: "Application",
      debugShowCheckedModeBanner: false,
      // Translations Section
      translations: Strings(),
      locale: LanguageService().loadLanguage(),
      fallbackLocale: Locale('en', 'US'),
      // Theme Section
      theme: AppThemes.lightThemeData,
      darkTheme: AppThemes.darkThemeData,
      themeMode: ThemeService().getThemeMode(),
      // Routes
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

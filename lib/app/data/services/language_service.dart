import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';

class LanguageService {
  final _getStorage = GetStorage();
  Locale loadLanguage() {
    final languageCode = _getStorage.read(GetStorageKey.LANGUAGE) ?? 'en';
    final countryCode = _getStorage.read(GetStorageKey.COUNTRY_CODE) ?? 'US';
    return Locale(languageCode, countryCode);
  }

  void saveLanguage(String? languageCode, String? countryCode) {
    try {
      _getStorage.write(GetStorageKey.LANGUAGE, languageCode);
      _getStorage.write(GetStorageKey.COUNTRY_CODE, countryCode);
    } on Error catch (e) {
      print(e.toString());
    }
  }

  void changeLanguage(String param1, String param2) {
    Locale locale = Locale(param1, param2);
    Get.updateLocale(locale);
    saveLanguage(locale.languageCode, locale.countryCode);
  }
}

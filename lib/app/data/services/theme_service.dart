import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';

class ThemeService {
  final _getStorage = GetStorage();

  ThemeMode getThemeMode() {
    return isDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isDarkMode() {
    return _getStorage.read(GetStorageKey.IS_DARK_MODE) ?? false;
  }

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(GetStorageKey.IS_DARK_MODE, isDarkMode);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isDarkMode());
  }
}

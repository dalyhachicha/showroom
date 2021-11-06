import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF3D3D3D);
  static const Color grey = Color(0xFF848484);
  static const Color lightGrey = Color(0xFFBBBBBB);
  static const Color extraLightGrey = Color(0xFFF1F1F1);

  var kPrimaryTextColor =
      GetStorage().read(GetStorageKey.IS_DARK_MODE) ? extraLightGrey : darkGrey;

  var kSecondaryTextColor =
      GetStorage().read(GetStorageKey.IS_DARK_MODE) ? darkGrey : extraLightGrey;
}

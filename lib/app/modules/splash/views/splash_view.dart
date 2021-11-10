import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showroom/app/data/theme/color_theme.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final getStorage = GetStorage();
  final SplashController splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () async {
      splashController.redirectUser();
    });

    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: SafeArea(
        child: Center(
            child: CircularProgressIndicator(
          color: AppColors.extraLightGrey,
        )),
      ),
    );
  }
}

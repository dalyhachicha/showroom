import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';

import 'package:showroom/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final getStorage = GetStorage();
  final SplashController splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      splashController.redirectUser();
    });

    return Scaffold(
      body: SafeArea(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

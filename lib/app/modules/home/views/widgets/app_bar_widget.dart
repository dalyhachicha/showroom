import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/routes/app_pages.dart';

appBar() {
  return AppBar(
    // leading: Icon(Icons.menu),
    actions: [
      IconButton(
        onPressed: () {
          Get.toNamed(Routes.CART);
        },
        icon: Icon(Icons.shopping_bag),
      ),
    ],
    title: Text(
      'Showroom',
      style: AppTextStyle.appBarTitle,
    ),
    centerTitle: true,
  );
}

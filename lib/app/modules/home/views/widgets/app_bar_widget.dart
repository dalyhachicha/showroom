import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/cart/controllers/cart_controller.dart';
import 'package:showroom/app/routes/app_pages.dart';

appBar() {
  CartController _cartController = Get.find();
  return AppBar(
    // leading: Icon(Icons.menu),
    actions: [
      IconButton(
        onPressed: () {
          Get.toNamed(Routes.CART);
        },
        icon: Obx(
          () => Icon(_cartController.products.isNotEmpty
              ? Icons.shopping_bag_rounded
              : Icons.shopping_bag_outlined),
        ),
      ),
    ],
    title: Text(
      'Showroom',
      style: AppTextStyle.appBarTitle,
    ),
    centerTitle: true,
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/product_model.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/product/controllers/product_controller.dart';

class AddToCartButton extends StatelessWidget {
  final ProductModel product;
  AddToCartButton({Key? key, required this.product}) : super(key: key);
  ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (productController.selectedSize.value < 0) {
          Get.snackbar('Select Size',
              'to add item to your cart you need to select your size.');
        } else {
          // Add item to cart
          Get.snackbar('ADDED', 'CART +1');
        }
      },
      child: Container(
        child: Center(
          child: Text('Add To Cart',
              style: AppTextStyle.productPagePriceLabel.copyWith(
                  color: Theme.of(context).colorScheme.primary, fontSize: 14)),
        ),
        width: 136,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
      ),
    );
  }
}

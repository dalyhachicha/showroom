import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/product_model.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/cart/controllers/cart_controller.dart';
import 'package:showroom/app/modules/product/controllers/product_controller.dart';
import 'package:showroom/app/modules/widgets/custom_snackbar.dart';

class AddToCartButton extends StatelessWidget {
  final ProductModel product;
  AddToCartButton({Key? key, required this.product}) : super(key: key);
  final ProductController productController = Get.find();
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (productController.selectedSize.value < 0) {
          customSnackbar(
            title: 'Size',
            message: 'Please select your size',
            position: SnackPosition.BOTTOM,
          );
        } else {
          cartController.addProduct(
              product, productController.selectedSize.value);
          customSnackbar(
            title: 'Cart',
            message: 'You have added ${product.name} to your cart',
            position: SnackPosition.BOTTOM,
          );
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

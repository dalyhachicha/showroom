import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/product_model.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/cart/controllers/cart_controller.dart';
import 'package:showroom/app/routes/app_pages.dart';

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final ProductModel product;
  final int qte;
  final int index;
  CartProductCard(
      {Key? key,
      required this.controller,
      required this.product,
      required this.qte,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.PRODUCT, arguments: [product]);
            },
            child: Container(
              height: 110,
              width: 95,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(product.imgUrls[0])),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: AppTextStyle.cartPageProductName,
              ),
              SizedBox(height: 2),
              Text(
                'Size: ${product.sizes[controller.selectedSizes[product]].size}',
                style: AppTextStyle.cartPageProductSize,
              ),
              SizedBox(height: 8),
              Text(
                '${product.price.toStringAsFixed(2)} dt',
                style: AppTextStyle.cartPageProductPrice,
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  controller.addProduct(
                      product, controller.selectedSizes[product]);
                },
                icon: Icon(Icons.add_circle),
              ),
              Text(
                qte.toString(),
                style: AppTextStyle.cartPageProductQte,
              ),
              IconButton(
                onPressed: () {
                  controller.removeProduct(product);
                },
                icon: qte > 1
                    ? Icon(Icons.remove_circle_outline)
                    : Icon(Icons.delete_forever),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

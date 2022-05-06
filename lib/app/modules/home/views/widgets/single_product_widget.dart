import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/product_model.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/routes/app_pages.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;
  SingleProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCT, arguments: [product]);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground, //Colors.black45
          borderRadius: BorderRadius.circular(12),
        ),
        child: Wrap(
          children: [
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    product.imgUrls[0],
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  )),
            ),
            Wrap(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.name,
                        style: AppTextStyle.productCardTitle.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                      Text(
                        '${product.price} DT',
                        style: AppTextStyle.productCardPrice.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

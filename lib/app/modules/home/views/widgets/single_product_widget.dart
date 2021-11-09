import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/product_model.dart';
import 'package:showroom/app/data/services/theme_service.dart';
import 'package:showroom/app/data/theme/app_theme.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/routes/app_pages.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;
  SingleProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCT);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(12),
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.grey,
          //     offset: Offset(0, 2),
          //     blurRadius: 2,
          //   ),
          // ],
        ),
        child: Column(
          children: [
            Container(
              height: 190,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product.name,
                    style: AppTextStyle.productCardTitle,
                  ),
                  Text(
                    '${product.price} DT',
                    style: AppTextStyle.productCardPrice,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

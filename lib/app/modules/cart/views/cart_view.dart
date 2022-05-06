import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/cart/views/widgets/cart_product_card.dart';
import 'package:showroom/app/routes/app_pages.dart';
import '../controllers/cart_controller.dart';
import '../views/widgets/appbar_counter_widget.dart';

class CartView extends GetView<CartController> {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Cart'),
        centerTitle: true,
        actions: [
          Obx(
            () => AppBarCounterWidget(count: cartController.products.length),
          ),
        ],
      ),
      body: Obx(
        () => cartController.products.isNotEmpty
            ? Column(
                children: [
                  Obx(
                    () => SizedBox(
                      height: 600,
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            controller: cartController,
                            product:
                                cartController.products.keys.toList()[index],
                            qte: cartController.products.values.toList()[index],
                            index: index,
                          );
                        },
                        itemCount: cartController.products.length,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: cartPageBottom(),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your cart is empty.",
                        style: AppTextStyle.productPageName),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.HOME);
                      },
                      child: Text(
                        'Shop',
                        style: AppTextStyle.productPageName.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget cartPageBottom() {
    return Container(
      color: Get.theme.colorScheme.background,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      'Subtotal: ',
                      style: AppTextStyle.cartPageProductSize
                          .copyWith(fontSize: 16),
                    ),
                    Text(
                      '${cartController.subtotal} dt',
                      style:
                          AppTextStyle.cartPageTotalText.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Delivery: ',
                      style: AppTextStyle.cartPageProductSize
                          .copyWith(fontSize: 16),
                    ),
                    Text(
                      '7 dt',
                      style:
                          AppTextStyle.cartPageTotalText.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 78,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Obx(
                  () => Center(
                    child: Text(
                      '${cartController.total} DT',
                      style: AppTextStyle.cartPageTotalText,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartController.addOrder();
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        'Next >',
                        style: AppTextStyle.productPagePriceLabel
                            .copyWith(color: Get.theme.colorScheme.background),
                      ),
                    ),
                    width: 170,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.onBackground,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

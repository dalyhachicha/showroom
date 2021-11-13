import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:showroom/app/modules/cart/views/widgets/appbar_counter_widget.dart';
import 'package:showroom/app/modules/history/views/widgets/order_card_widget.dart';
import 'package:showroom/app/routes/app_pages.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  final HistoryController historyController = Get.find();
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
        title: Text('History'),
        centerTitle: true,
        actions: [
          Obx(
            () => AppBarCounterWidget(count: historyController.orders.length),
          ),
        ],
      ),
      body: Obx(
        () => historyController.orders.isNotEmpty
            ? Stack(
                children: [
                  Obx(
                    () => SizedBox(
                      height: 600,
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (context, index) {
                          return OrderCard(
                            order: historyController.orders[index],
                          );
                        },
                        itemCount: historyController.orders.length,
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your History is empty.",
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
}

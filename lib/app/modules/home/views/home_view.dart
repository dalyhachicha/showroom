import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/product_model.dart';
import 'package:showroom/app/modules/home/views/widgets/single_product_widget.dart';

import '../controllers/home_controller.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/home_top_section_widget.dart';

class HomeView extends StatelessWidget {
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: appBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTopSection(),
            Expanded(
              child: Obx(() {
                if (homeController.products.isEmpty) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Get.theme.colorScheme.onBackground,
                    ),
                  );
                } else {
                  return GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children:
                        homeController.products.map((ProductModel product) {
                      return SingleProductWidget(
                        product: product,
                      );
                    }).toList(),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}

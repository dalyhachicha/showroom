import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:showroom/app/data/models/product_model.dart';
import 'package:showroom/app/data/theme/color_theme.dart';
import 'package:showroom/app/data/theme/text_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controllers/product_controller.dart';
import 'widgets/add_to_cart_btn.dart';

class ProductView extends GetView<ProductController> {
  ProductController productController = Get.find();
  final ProductModel product = Get.arguments[0];
  @override
  Widget build(BuildContext context) {
    final List<String> imgUrls = product.imgUrls;
    return Scaffold(
      body: Stack(
        children: [
          //Carousel
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: imgUrls.length,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  productController.activeIndex.value = index;
                },
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1,
              ),
              itemBuilder: (context, index, realIndex) {
                final imgUrl = imgUrls[index];
                return buildImage(imgUrl, index);
              },
            ),
          ),
          // TOP SECTION
          Positioned(
            top: 30,
            right: 20,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Obx(
                () => buildIndicator(),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 80,
            child: Obx(
              () => AnimatedContainer(
                decoration: BoxDecoration(
                    color: Get.theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    )),
                alignment: Alignment.centerRight,
                duration: Duration(milliseconds: 500),
                height: 205,
                width: productController.containerWidth.value,
                child: productController.isVisible.value
                    ? buildContainerContent()
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () {
                            toggleContainer();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.grey,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainerContent() {
    return Container(
      width: productController.containerWidth.value,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                toggleContainer();
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 12),
              Center(
                child: Text(
                  product.name,
                  style: AppTextStyle.productPageName
                      .copyWith(color: Get.theme.colorScheme.onPrimary),
                ),
              ),
              Center(
                child: Text(
                  product.desc,
                  style: AppTextStyle.productPageDesc,
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: Text(
                  'SIZE',
                  style: AppTextStyle.productPageSizeText,
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < product.sizes.length; i++)
                    buildSizeTile(
                        product.sizes[i].size, product.sizes[i].qte, i),
                ],
              ),
              // SizedBox(height: 20),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 48,
              width: productController.containerWidth.value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(product.price.toStringAsFixed(2) + ' DT',
                      style: AppTextStyle.productPagePriceLabel),
                  AddToCartButton(product: product),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildSizeTile(String size, int qte, int index) {
    if (qte > 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
          onTap: () {
            productController.selectedSize.value = index;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                    child: Text(
                  size,
                  style: AppTextStyle.productPageSizeLabel
                      .copyWith(color: Get.theme.colorScheme.primary),
                )),
              ),
              SizedBox(height: 4),
              productController.selectedSize.value == index
                  ? Container(
                      width: 37,
                      height: 2,
                      decoration: BoxDecoration(
                        color: Get.theme.colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  toggleContainer() {
    if (productController.containerWidth.value == 300) {
      productController.isVisible.value = false;
      Future.delayed(
        Duration(milliseconds: 300),
      ).then((value) => productController.containerWidth.value = 56.0);
    } else {
      productController.containerWidth.value = 300;
      Future.delayed(
        Duration(milliseconds: 300),
      ).then((value) => productController.isVisible.value = true);
    }
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: ExpandingDotsEffect(
          dotWidth: 14,
          dotHeight: 14,
          dotColor: AppColors.lightGrey,
          activeDotColor: AppColors.darkGrey,
        ),
        activeIndex: productController.activeIndex.value,
        count: product.imgUrls.length,
      );

  Widget buildImage(String imgUrl, int index) => Container(
        // margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          imgUrl,
          fit: BoxFit.fitHeight,
        ),
      );
}

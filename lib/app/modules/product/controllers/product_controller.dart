import 'package:get/get.dart';
import 'package:showroom/app/modules/cart/controllers/cart_controller.dart';

class ProductController extends GetxController {
  var activeIndex = 0.obs;
  RxDouble containerWidth = RxDouble(56.0);
  RxBool isVisible = RxBool(false);
  RxInt selectedSize = RxInt(-1);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

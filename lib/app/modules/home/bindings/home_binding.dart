import 'package:get/get.dart';
import 'package:showroom/app/modules/cart/controllers/cart_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put(CartController(), permanent: true);
  }
}

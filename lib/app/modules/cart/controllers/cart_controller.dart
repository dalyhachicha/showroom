import 'package:get/get.dart';
import 'package:showroom/app/data/models/product_model.dart';

class CartController extends GetxController {
  var products = {}.obs;
  var selectedSizes = {}.obs;

  void addProduct(ProductModel product, int size) {
    if (products.containsKey(product)) {
      products[product] += 1;
    } else {
      products[product] = 1;
    }
    selectedSizes[product] = size;
  }

  void removeProduct(ProductModel product) {
    if (products.containsKey(product) && products[product] == 1) {
      products.removeWhere((key, value) => key == product);
    } else {
      products[product] -= 1;
    }
  }

  get subtotal => products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);

  get total => (subtotal + 7).toStringAsFixed(2);

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

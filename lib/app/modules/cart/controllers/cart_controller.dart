import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showroom/app/data/models/order_model.dart';
import 'package:showroom/app/data/models/product_model.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';
import 'package:showroom/app/modules/history/controllers/history_controller.dart';
import 'package:showroom/app/modules/widgets/custom_snackbar.dart';
import 'package:showroom/app/routes/app_pages.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  final HistoryController _historyController = Get.find();
  String phoneNumber = GetStorage().read(GetStorageKey.PHONE_NUMBER);
  var products = {}.obs;
  var selectedSizes = {}.obs;

  OrderModel createOrder() {
    var order = OrderModel();
    order.id = Uuid().v1();
    order.date = DateTime.now().toString();
    order.order_by = phoneNumber;
    order.total = total;
    order.status = "hold";
    //products.keys.map((e) => order.items?.add(e.id));
    order.items = [];
    order.selectedSizes = [];
    products.keys.forEach((element) {
      order.items?.add(element.id);
      order.selectedSizes?.add(element.sizes[selectedSizes[element]].size);
    });
    return order;
  }

  void addOrder() {
    _historyController.addOrder(createOrder());
    products.value = {};
    selectedSizes.value = {};
    customSnackbar(
      title: 'Order Sent Successfully',
      message: 'Please wait until we verify your order.',
      position: SnackPosition.BOTTOM,
    );
  }

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

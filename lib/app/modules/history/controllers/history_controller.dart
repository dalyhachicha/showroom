import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showroom/app/data/models/order_model.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';
import 'package:showroom/app/modules/widgets/custom_snackbar.dart';

class HistoryController extends GetxController {
  RxList<OrderModel> orders = RxList<OrderModel>([]);
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String phoneNumber = GetStorage().read(GetStorageKey.PHONE_NUMBER);

  @override
  void onInit() {
    print(orders.length);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    orders.bindStream(getAllOrders());
  }

  @override
  void onClose() {}

  void addOrder(OrderModel order) {
    firebaseFirestore.collection("orders").add(order.toJson()).catchError(
          (error) => customSnackbar(
            title: 'Order Failed!',
            message: 'Coudn\'t add order.\nplease try later or contact us.',
            position: SnackPosition.BOTTOM,
          ),
        );
  }

  Stream<List<OrderModel>> getAllOrders() => firebaseFirestore
      .collection("orders")
      .where('order_by', isEqualTo: phoneNumber)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => OrderModel.fromJson(item.data())).toList());
}

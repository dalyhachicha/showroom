import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/product_model.dart';

class HomeController extends GetxController {
  RxList<ProductModel> products = RxList<ProductModel>([]);
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    products.bindStream(getAllProduct());
  }

  @override
  void onClose() {}

  Stream<List<ProductModel>> getAllProduct() => firebaseFirestore
      .collection("products")
      .snapshots()
      .map((query) => query.docs
          .map((item) => ProductModel.fromJson(item.data()))
          .toList());
}

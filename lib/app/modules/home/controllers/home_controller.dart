import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:showroom/app/data/models/user_model.dart';

class HomeController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("users");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

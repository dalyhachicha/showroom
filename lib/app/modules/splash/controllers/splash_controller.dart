import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';
import 'package:showroom/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();
  var isLoggedIn = false.obs;

  void redirectUser() {
    isLoggedIn.value
        ? Get.offAllNamed(Routes.HOME)
        : Get.offAllNamed(Routes.ONBOARDING);
  }

  void checkiflogged() {
    getStorage.read(GetStorageKey.IS_LOGGED_IN)
        ? isLoggedIn.value = true
        : isLoggedIn.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getStorage.writeIfNull(GetStorageKey.IS_LOGGED_IN, false);
    checkiflogged();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

import 'package:get/get.dart';

import 'cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removePhoneNumber();
  }

  void login(String? phoneNumber) async {
    isLogged.value = true;
    //Token is cached
    await savePhoneNumber(phoneNumber);
  }

  void checkLoginStatus() {
    final phoneNumber = getPhoneNumber();
    if (phoneNumber != null) {
      isLogged.value = true;
    }
  }
}

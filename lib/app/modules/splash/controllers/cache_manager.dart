import 'package:get_storage/get_storage.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';

mixin CacheManager {
  Future<bool> savePhoneNumber(String? phoneNumber) async {
    final box = GetStorage();
    await box.write(GetStorageKey.PHONE_NUMBER, phoneNumber);
    return true;
  }

  String? getPhoneNumber() {
    final box = GetStorage();
    return box.read(GetStorageKey.PHONE_NUMBER);
  }

  Future<void> removePhoneNumber() async {
    final box = GetStorage();
    await box.remove(GetStorageKey.PHONE_NUMBER);
  }
}

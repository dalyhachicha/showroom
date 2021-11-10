import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:showroom/app/data/services/theme_service.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? name, phoneNumber, address, creationDate;
  UserModel({
    this.name,
    this.phoneNumber,
    this.address,
    this.creationDate,
  });

  UserModel.fromMap(DocumentSnapshot data) {
    name = data["name"];
    phoneNumber = data["phoneNumber"];
    address = data["address"];
    creationDate = data["creationDate"];
  }

  completeData() {
    creationDate = DateTime.now().toString();
  }

  logout() {
    final _getStorage = GetStorage();
    if (ThemeService().isDarkMode()) ThemeService().changeThemeMode();
    _getStorage.remove(GetStorageKey.IS_DARK_MODE);
    _getStorage.remove(GetStorageKey.IS_LOGGED_IN);
    _getStorage.remove(GetStorageKey.PHONE_NUMBER);
  }

  saveUserIsLoggedIn() {
    final _getStorage = GetStorage();
    _getStorage.write(GetStorageKey.IS_LOGGED_IN, true);
  }

  String? loadPhoneNumber() {
    final _getStorage = GetStorage();
    return _getStorage.read(GetStorageKey.PHONE_NUMBER);
  }

  storePhoneNumber() {
    final _getStorage = GetStorage();
    _getStorage.write(GetStorageKey.PHONE_NUMBER, phoneNumber);
  }

  /// factory.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

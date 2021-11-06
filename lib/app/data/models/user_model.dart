import 'package:get_storage/get_storage.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:showroom/app/data/utils/get_storage_keys.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? name, phoneNumber, address, long, alt, creationDate;
  UserModel({
    this.name,
    this.phoneNumber,
    this.address,
    this.long,
    this.alt,
    this.creationDate,
  });

  completeData() {
    creationDate = DateTime.now().toString();
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

import 'package:get/get.dart';
import 'package:pos_app/core/models/shared_user_model.dart';
import 'package:pos_app/core/models/user/client_model.dart';
import 'package:pos_app/core/util/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxService {
  late SharedPreferences _sharedPreferences;

  RxBool isLoading = true.obs;

  Future<UserService> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<SharedUserModel> getSharedUserModel() async {
    isLoading.value = false;

    return SharedUserModel(
        username: await getPrefString(Constants.USERNAME),
        is_login: await getPrefBool(Constants.IS_LOGIN),
        user_id: await getPrefInt(Constants.USER_ID),
        role: await getPrefInt(Constants.ROLE));
  }

  String getPrefString(String key) {
    return _sharedPreferences.getString(key) ?? 'Guest';
  }

  int getPrefInt(String key) {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  bool getPrefBool(String key) {
    return _sharedPreferences.getBool(key) ?? false;
  }

  Future<void> saveString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  Future<void> saveBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  Future<void> saveInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  Future<void> saveUserInfo(ClientModel clientModel) async {
    isLoading.value = false;
    await saveBool(Constants.IS_LOGIN, true);
    await saveInt(Constants.USER_ID, clientModel.user_id);
    await saveString(Constants.USERNAME, clientModel.name);
    await saveInt(Constants.ROLE, clientModel.role);
  }
}

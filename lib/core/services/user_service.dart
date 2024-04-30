import 'package:get/get.dart';
import 'package:pos_app/core/models/shared_user_model.dart';
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
    return _sharedPreferences.getString(key) ?? 'kevin';
  }

  int getPrefInt(String key) {
    return _sharedPreferences.getInt(key) ?? 0;
  }

  bool getPrefBool(String key) {
    return _sharedPreferences.getBool(key) ?? false;
  }
}

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pos_app/core/services/user_service.dart';
import 'package:pos_app/routes/app_pages.dart';

class DashboardAdminController extends GetxController {
  RxInt stateSelectedIndex = 0.obs;
  final _userService = Get.put(UserService());

  Future logOut() async {
    await _userService.initSharedPref();
    await _userService.destroySession();
    Get.offAllNamed(Routes.LOGIN);
  }
}

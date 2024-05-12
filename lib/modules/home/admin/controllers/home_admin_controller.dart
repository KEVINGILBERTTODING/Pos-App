import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pos_app/core/models/dashboard/dashboard_model.dart';
import 'package:pos_app/core/models/shared_user_model.dart';
import 'package:pos_app/core/models/user/client_model.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/services/user_service.dart';
import 'package:pos_app/core/util/constans.dart';

class HomeAdminController extends GetxController {
  RxBool isLoading = false.obs;
  final apiService = Get.put(ApiService());
  final userService = Get.put(UserService());
  SharedUserModel sharedUserModel = SharedUserModel();
  Rx<DashboardModel> dashboardModel = DashboardModel().obs;

  Future<SharedUserModel> getUserData() async {
    final userData = await userService.getSharedUserModel();
    sharedUserModel = userData;
    return sharedUserModel;
  }

  Future<void> dashboard() async {
    try {
      isLoading.value = true;
      final responseApi = await apiService.dashboard();
      isLoading.value = false;

      if (responseApi.responsestate == Constants.SUCCESS_STATE) {
        dashboardModel.value = responseApi.data;
        print(dashboardModel.value.data_pendapatan);
        return;
      } else {
        Get.snackbar('Error', 'Gagal memuat data');
        return;
      }
    } catch (e) {
      Get.snackbar('Error', 'Server error');
      return;
    }
  }
}

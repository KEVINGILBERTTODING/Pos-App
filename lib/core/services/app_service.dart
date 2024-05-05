import 'package:get/get.dart';
import 'package:pos_app/core/models/app/app_model.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/util/constans.dart';

class AppService extends GetxService {
  Rx<AppModel> appModel = AppModel().obs;
  final apiService = Get.put(ApiService());

  @override
  void onInit() {
    fetchAppData();
  }

  // AppModel get appModel => _appModel.value;

  Future<void> fetchAppData() async {
    final response = await apiService.getApp();
    if (response.responsestate == Constants.SUCCESS_STATE &&
        response.data != null) {
      appModel.value = response.data;
      print('berhasil memuat app data');
      return;
    }
    print('gagal memuat app data');
    return;
  }
}

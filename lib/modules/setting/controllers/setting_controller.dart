import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/models/app/app_model.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/util/constans.dart';

class SettingController extends GetxController {
  final apiService = Get.put(ApiService());
  RxBool isLoading = false.obs;
  Rx<AppModel> appModel = AppModel().obs;
  TextEditingController companyNameFieldController = TextEditingController();
  TextEditingController companyAddressFieldController = TextEditingController();
  TextEditingController companyTelpFieldController = TextEditingController();
  TextEditingController companyDiscFieldController = TextEditingController();

  Future<void> getData() async {
    isLoading.value = true;
    final responseApi = await apiService.getApp();
    isLoading.value = false;
    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      appModel.value = responseApi.data;

      companyNameFieldController.text = appModel.value.nama_perusahaan;
      companyAddressFieldController.text = appModel.value.alamat;
      companyDiscFieldController.text = appModel.value.diskon.toString();
      companyTelpFieldController.text = appModel.value.telepon.toString();
      return;
    } else {
      appModel.value = AppModel();
      return;
    }
  }
}

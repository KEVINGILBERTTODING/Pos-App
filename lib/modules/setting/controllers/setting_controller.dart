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
  RxBool isLoadingStore = false.obs;

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

  void formValidate() async {
    String companyName = companyNameFieldController.text;
    String discount = companyDiscFieldController.text;
    String telp = companyTelpFieldController.text;
    String address = companyAddressFieldController.text;

    if (companyName == '') {
      Get.snackbar('Error', 'Nama perusahaan tidak boleh kosong');
      return;
    }

    if (discount == '') {
      Get.snackbar('Error', 'Diskon tidak boleh kosong');
      return;
    }
    if (telp == '') {
      Get.snackbar('Error', 'No handphone tidak boleh kosong');
      return;
    }
    if (address == '') {
      Get.snackbar('Error', 'Alamat tidak boleh kosong');
      return;
    }
    Map<String, dynamic> data = {
      'nama_perusahaan': companyName,
      'telepon': telp,
      'alamat': address,
      'diskon': discount
    };

    await updateData(data);
  }

  Future<void> updateData(Map<String, dynamic> data) async {
    isLoadingStore.value = true;
    final responseApi = await apiService.updateSetting(data);
    isLoadingStore.value = false;

    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      Get.snackbar('Berhasil', 'Berhasil mengubah data');
      return;
    } else {
      Get.snackbar('Erorr', responseApi.message.toString());
      return;
    }
  }
}

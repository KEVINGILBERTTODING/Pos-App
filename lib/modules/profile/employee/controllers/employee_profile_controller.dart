import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pos_app/core/models/api/response_api_model.dart';
import 'package:pos_app/core/models/user/client_model.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/services/user_service.dart';
import 'package:pos_app/core/util/constans.dart';
import 'package:pos_app/modules/profile/employee/bindings/employee_profile_binding.dart';

class EmployeeProfileController extends GetxController {
  RxBool isLoading = true.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController oldPwController = TextEditingController();
  TextEditingController newPw = TextEditingController();
  final userService = Get.put(UserService());
  final apiService = Get.put(ApiService());
  Rx<ClientModel> clientModel = ClientModel().obs;
  RxBool isLoadingUpdateData = false.obs;

  @override
  void onInit() async {
    await getProfile();
    super.onInit();
  }

  Future<void> inputValidation() async {
    if (nameController.text.isEmpty) {
      Get.snackbar('Gagal', 'Nama tidak boleh kosong');
      return;
    }

    if (!oldPwController.text.isEmpty) {
      if (newPw.text.isEmpty) {
        Get.snackbar('Gagal', 'Kata sandi baru tidak boleh kosong');
        return;
      }
    }

    await updateProfile();
  }

  Future<void> getProfile() async {
    isLoading.value = true;
    int userId = await userService.getPrefInt(Constants.USER_ID);
    print('user_id $userId');

    ResponseApiModel responseApiModel = await apiService.getProfile(userId);

    if (responseApiModel.responsestate == Constants.SUCCESS_STATE &&
        responseApiModel.data != null) {
      isLoading.value = false;
      final ClientModel clientModels = responseApiModel.data;
      clientModel.value = clientModels;

      print(clientModel.value.foto.toString());

      nameController.text = clientModels.name;

      print('berhasil');

      return;
    } else {
      print('gagal');
      Get.snackbar("Error", 'Terjadi kesalahan');
      return;
    }
  }

  Future<void> updateProfile() async {
    isLoadingUpdateData.value = true;
    int userId = await userService.getPrefInt(Constants.USER_ID);

    if (userId != 0) {
      Map<String, dynamic> map = {};
      map['name'] = nameController.text;
      map['user_id'] = userId.toString();
      if (!oldPwController.text.isEmpty) {
        map['old_password'] = oldPwController.text;
      }

      if (!newPw.text.isEmpty) {
        map['new_password'] = newPw.text;
      }

      // updat profile
      final responseApi = await apiService.updateProfile(map, userId);
      isLoadingUpdateData.value = false;

      if (responseApi.responsestate == Constants.SUCCESS_STATE) {
        await userService.saveString(Constants.USERNAME, nameController.text);
        newPw.text = '';
        oldPwController.text = '';
        Get.snackbar("Berhasil", responseApi.message.toString());
        return;
      } else {
        Get.snackbar("Berhasil", responseApi.message.toString());
        return;
      }
    }

    Get.snackbar('Error', 'User tidak ditemukan');

    return;
  }
}

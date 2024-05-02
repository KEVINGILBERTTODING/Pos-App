import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
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

  @override
  void onInit() async {
    await getProfile();
    super.onInit();
  }

  void inputValidation() async {
    if (nameController.text.isEmpty) {
      Get.snackbar('Gagal', 'Nama tidak boleh kosong');
      return;
    }

    if (oldPwController.text.isEmpty) {
      Get.snackbar('Gagal', 'Kata sandi lama tidak boleh kosong');
      return;
    }

    if (newPw.text.isEmpty) {
      Get.snackbar('Gagal', 'Kata sandi baru tidak boleh kosong');
      return;
    }

    if (newPw.text.isEmpty) {
      Get.snackbar('Gagal', 'Kata sandi baru tidak boleh kosong');
      return;
    }
  }

  Future<void> getProfile() async {
    isLoading.value = true;
    int userId = await userService.getPrefInt(Constants.USER_ID);
    print('user_id $userId');

    ResponseApiModel responseApiModel = await apiService.getProfile(userId);

    if (responseApiModel.responsestate == Constants.SUCCESS_STATE &&
        responseApiModel.data != null) {
      isLoading.value = false;
      final ClientModel clientModel = responseApiModel.data;
      nameController.text = clientModel.name;

      Get.snackbar("Berhasil", responseApiModel.message.toString());
      print('berhasil');

      return;
    } else {
      print('gagal');
      Get.snackbar("Error", 'Terjadi kesalahan');
      return;
    }
  }
}

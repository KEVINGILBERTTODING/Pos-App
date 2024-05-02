import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pos_app/core/models/api/response_api_model.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/services/user_service.dart';
import 'package:pos_app/core/util/constans.dart';
import 'package:pos_app/routes/app_pages.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  RxBool isLoading = false.obs;
  final apiService = Get.put(ApiService());
  final userService = Get.put(UserService());

  void validateLogin() {
    if (emailController.text.isEmpty) {
      Get.snackbar("Gagal", "Email tidak boleh kosong");
      return;
    }

    if (pwController.text.isEmpty) {
      Get.snackbar("Gagal", "Password tidak boleh kosong");
      return;
    }
    login();
  }

  Future<void> login() async {
    isLoading.value = true;
    final Map<String, String> data = {
      'email': emailController.text,
      'password': pwController.text
    };

    ResponseApiModel responseApiModel = await apiService.login(data);

    if (responseApiModel.responsestate == Constants.SUCCESS_STATE &&
        responseApiModel.data != null) {
      await userService.initSharedPref();
      // save user info
      await userService.saveUserInfo(responseApiModel.data);
      isLoading.value = false;
      Get.snackbar("Berhasil", responseApiModel.message.toString());
      Get.offAllNamed(Routes.DASBOARD_EMPLOYEE);
      return;
    } else {
      isLoading.value = false;

      Get.snackbar("Error", responseApiModel.message.toString());
      return;
    }
  }
}

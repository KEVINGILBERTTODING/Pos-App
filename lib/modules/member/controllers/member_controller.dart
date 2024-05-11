import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/models/member/member_model.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/util/constans.dart';

class MemberController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingStore = false.obs;
  final apiService = Get.put(ApiService());
  RxList<MemberModel> memberModelList = <MemberModel>[].obs;
  TextEditingController namaMemberController = TextEditingController();
  TextEditingController teleponMemberController = TextEditingController();
  TextEditingController alamatMemberController = TextEditingController();

  Future<void> getMember() async {
    isLoading.value = true;
    final responseApi = await apiService.getMember();
    isLoading.value = false;

    if (responseApi.responsestate == Constants.SUCCESS_STATE &&
        responseApi.data != null) {
      memberModelList.clear();
      memberModelList.addAll(responseApi.data);
      return;
    } else {
      Get.snackbar('Error', 'Gagal memuat data member');
      return;
    }
  }

  Future<void> storeMember() async {
    final Map<String, String> data = {
      'nama': namaMemberController.text,
      'telepon': teleponMemberController.text,
      'alamat': alamatMemberController.text,
    };

    isLoadingStore.value = true;
    final responseApi = await apiService.storeMember(data);
    isLoadingStore.value = false;

    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      await getMember();
      cleanField();
      Get.snackbar('Berhasil', 'Berhasil menyimpan data member');
      return;
    } else {
      Get.snackbar('Error', 'Gagal memuat data member');
      return;
    }
  }

  void cleanField() {
    namaMemberController.clear();
    teleponMemberController.clear();
    alamatMemberController.clear();
    return;
  }

  Future validationStore() async {
    if (namaMemberController.text == '') {
      Get.snackbar('Error', 'Nama tidak boleh kosong');
      return;
    }

    if (teleponMemberController.text == '') {
      Get.snackbar('Error', 'Telepon tidak boleh kosong');
      return;
    }

    if (alamatMemberController.text == '') {
      Get.snackbar('Error', 'Alamat tidak boleh kosong');
      return;
    }

    await storeMember();
  }

  Future<void> destroyMember(int memberId, int position) async {
    if (memberId < 0 || memberId == '') {
      Get.snackbar('Error', 'Member tidak valid');
      return;
    }
    isLoadingStore.value = true;

    // validate
    final responseApi = await apiService.destroyMember(memberId);
    isLoadingStore.value = false;
    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      Get.snackbar('Berhasil', 'Berhasil menghapus member');
      memberModelList.removeAt(position);
      memberModelList.refresh();

      return;
    }
    Get.snackbar('Error', responseApi.message.toString());
    return;
  }
}

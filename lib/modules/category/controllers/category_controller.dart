import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/models/category/kategori_model.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/util/constans.dart';

class CategoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<KategoriModel> categoryModelList = <KategoriModel>[].obs;
  final apiService = Get.put(ApiService());
  RxBool isLoadingStore = false.obs;
  TextEditingController controllerNamaKategori = TextEditingController();

  Future<void> getCategory() async {
    try {
      isLoading.value = true;
      final getCategory = await apiService.getCategory();
      isLoading.value = false;

      if (getCategory.responsestate == Constants.SUCCESS_STATE) {
        categoryModelList.clear();
        categoryModelList.addAll(getCategory.data);
        update();

        return;
      }

      Get.snackbar('Error', 'Gagal memuat data kategori');
      return;
    } catch (e) {
      print(e.toString());

      Get.snackbar('Error', e.toString());
      return;
    }
  }

  Future<void> storeCategory() async {
    String namaKategori = controllerNamaKategori.text;
    if (namaKategori.isEmpty || namaKategori == '') {
      Get.snackbar('Error', 'Nama kategori tidak boleh kosong');
      return;
    }
    isLoadingStore.value = true;

    // validate
    final responseApi = await apiService.storeCategory(namaKategori);
    isLoadingStore.value = false;
    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      controllerNamaKategori.clear();
      Get.snackbar('Berhasil', 'Berhasil menambahkan kategori baru');
      getCategory();
      update();
      return;
    }
    Get.snackbar('Error', responseApi.message.toString());
    return;
  }

  Future<void> destroyCategory(int categoryId, int position) async {
    if (categoryId < 0 || categoryId == '') {
      Get.snackbar('Error', 'Kategori tidak valid');
      return;
    }
    isLoadingStore.value = true;

    // validate
    final responseApi = await apiService.destroyCategory(categoryId);
    isLoadingStore.value = false;
    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      controllerNamaKategori.clear();
      Get.snackbar('Berhasil', 'Berhasil menghapus kategori');
      categoryModelList.removeAt(position);
      categoryModelList.refresh();

      return;
    }
    Get.snackbar('Error', responseApi.message.toString());
    return;
  }
}

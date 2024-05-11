import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pos_app/core/models/category/kategori_model.dart';
import 'package:pos_app/core/models/product/product_model.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/util/constans.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productModelList = <ProductModel>[].obs;
  RxList<ProductModel> productModelList2 = <ProductModel>[].obs;
  RxList<KategoriModel> categoryModelList = <KategoriModel>[].obs;
  RxBool isLoadingProduct = false.obs;
  RxBool isLoadingCategory = false.obs;
  final apiService = Get.put(ApiService());
  RxString imageFile = ''.obs;
  final ImagePicker picker = ImagePicker();
  TextEditingController namaProductController = TextEditingController();
  TextEditingController kategoriProductController = TextEditingController();
  TextEditingController merkProductController = TextEditingController();
  TextEditingController hrgBeliProductController = TextEditingController();
  TextEditingController hrgJualProductController = TextEditingController();
  TextEditingController diskonProductController = TextEditingController();
  TextEditingController stokProductController = TextEditingController();
  String kategoriId = '';
  RxBool isLoadingStore = false.obs;

  Future<void> getProduct() async {
    if (productModelList.value.isEmpty) {
      try {
        isLoadingProduct.value = true;
        final getProduct = await apiService.getProduct();
        isLoadingProduct.value = false;

        if (getProduct.responsestate == Constants.SUCCESS_STATE) {
          productModelList.addAll(getProduct.data);
          productModelList2.addAll(getProduct.data);
          print('berhasul get produk');

          return;
        }
        print('gagal get produk');

        Get.snackbar('Error', 'Gagal memuat data kategori');
        return;
      } catch (e) {
        print(e.toString());

        Get.snackbar('Error', e.toString());
        return;
      }
    }
  }

  Future<void> searchProduct(String query) async {
    isLoadingProduct.value = true;
    try {
      // jika search bar kosong
      if (query.isEmpty || query == '') {
        productModelList.clear();

        productModelList.addAll(productModelList2.toList());
        isLoadingProduct.value = false;
        return;
      }

      // jika search bar tidak kosong
      final getProduct = await apiService.searchProduct(query);
      isLoadingProduct.value = false;

      if (getProduct.responsestate == Constants.SUCCESS_STATE) {
        productModelList.clear();

        productModelList.addAll(getProduct.data);
        print('berhasil get produk');

        return;
      }
      print('gagal search produk');

      return;
    } catch (e) {
      isLoadingProduct.value = false;

      print(e.toString());

      Get.snackbar('Error', 'Gagal memuat data produk');
      return;
    }
  }

  Future<void> getCategory() async {
    try {
      isLoadingCategory.value = true;
      final getCategory = await apiService.getCategory();
      isLoadingCategory.value = false;

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

  Future<void> getImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile.value = image.path;
      return;
    } else {
      Get.snackbar('Error', 'Gagal mengambil gambar produk');
      print('gambar produk tidak ada');
      return;
    }
  }

  void inputValidation() {
    if (namaProductController.text == '') {
      Get.snackbar('Error', 'Nama produk tidak boleh kosong');

      return;
    }

    if (kategoriId.isEmpty || kategoriId == '' || kategoriId == null) {
      Get.snackbar('Error', 'Kategori produk tidak boleh kosong');
      return;
    }

    if (merkProductController.text == '') {
      Get.snackbar('Error', 'Merk tidak boleh kosong');
      return;
    }

    if (hrgBeliProductController.text == '') {
      Get.snackbar('Error', 'Harga beli tidak boleh kosong');
      return;
    }

    if (hrgJualProductController.text == '') {
      Get.snackbar('Error', 'Harga jual tidak boleh kosong');
      return;
    }

    if (diskonProductController.text == '') {
      Get.snackbar('Error', 'Diskon tidak boleh kosong');
      return;
    }

    if (stokProductController.text == '') {
      Get.snackbar('Error', 'Stok tidak boleh kosong');
      return;
    }

    if (imageFile.isEmpty || imageFile == '' || imageFile == null) {
      Get.snackbar('Error', 'Gambar produk tidak boleh kosong');
      return;
    }

    // preparing before post
    final Map<String, String> data = {
      'merk': merkProductController.text,
      'id_kategori': kategoriId,
      'nama_produk': namaProductController.text,
      'harga_beli': cleanCurrencyFormat(hrgBeliProductController.text),
      'harga_jual': cleanCurrencyFormat(hrgJualProductController.text),
      'stok': stokProductController.text,
      'diskon': diskonProductController.text
    };

    storeProduct(imageFile.value, data);
  }

  Future<void> storeProduct(String imagePath, Map<String, String> data) async {
    isLoadingStore.value = true;
    final responseApi = await apiService.storeProduct(imagePath, data);
    isLoadingStore.value = false;

    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      Get.snackbar('Sukses', 'Berhasil menambahkan produk baru');
      productModelList.clear();
      productModelList2.clear();
      resetStateStore();
      await getProduct();

      return;
    } else {
      Get.snackbar('Gagal', responseApi.message.toString());
      return;
    }
  }

  void resetStateStore() {
    namaProductController.text = '';
    kategoriId = '';
    merkProductController.text = '';
    hrgBeliProductController.text = '';
    hrgJualProductController.text = '';
    diskonProductController.text = '';
    stokProductController.text = '';
    imageFile.value = '';
  }

  String cleanCurrencyFormat(String currency) {
    // Menghapus 'Rp. ' dan semua titik
    String noRp = currency.replaceAll('Rp. ', '').replaceAll('.', '');
    // Menghapus koma dan semua setelahnya
    String cleanNumber = noRp.split(',')[0];

    return cleanNumber;
  }
}

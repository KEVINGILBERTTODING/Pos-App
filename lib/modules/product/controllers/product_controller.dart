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
  RxBool isEditable = false.obs;
  int productId = 0;
  ProductModel productModel = ProductModel();

  Future<void> getProductData() async {
    try {
      productModelList.clear();
      isLoadingProduct.value = true;
      final getProduct = await apiService.getProduct();
      isLoadingProduct.value = false;

      if (getProduct.responsestate == Constants.SUCCESS_STATE) {
        productModelList.addAll(getProduct.data);

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

  Future<void> searchProduct(String query) async {
    isLoadingProduct.value = true;

    try {
      // jika search bar kosong
      if (query.isEmpty || query == '') {
        productModelList.clear();
        await getProductData();

        isLoadingProduct.value = false;
        return;
      } else {
        // jika search bar tidak kosong
        final getProduct = await apiService.searchProduct(query);
        isLoadingProduct.value = false;

        if (getProduct.responsestate == Constants.SUCCESS_STATE) {
          productModelList
              .clear(); // Clear the list before adding new search results
          productModelList.addAll(getProduct.data);
          print('berhasil get produk');

          return;
        }
        print('gagal search produk');

        return;
      }
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

    Map<String, String> data = {};

    if (isEditable.value != true) {
      // store produk baru
      // bukan edit produk
      if (imageFile.isEmpty || imageFile == '' || imageFile == null) {
        Get.snackbar('Error', 'Gambar produk tidak boleh kosong');
        return;
      } else {
        data = {
          'merk': merkProductController.text,
          'id_kategori': kategoriId,
          'nama_produk': namaProductController.text,
          'harga_beli': cleanCurrencyFormat(hrgBeliProductController.text),
          'harga_jual': cleanCurrencyFormat(hrgJualProductController.text),
          'stok': stokProductController.text,
          'diskon': diskonProductController.text
        };
        storeProduct(imageFile.value, data);
        return;
      }
    } else {
      // edit produkk
      if (productId == 0) {
        Get.snackbar('Error', 'Product tidak valid');
        return;
      } else {
        data = {
          'id_produk': productId.toString(),
          'merk': merkProductController.text,
          'id_kategori': kategoriId,
          'nama_produk': namaProductController.text,
          'harga_beli': cleanCurrencyFormat(hrgBeliProductController.text),
          'harga_jual': cleanCurrencyFormat(hrgJualProductController.text),
          'stok': stokProductController.text,
          'diskon': diskonProductController.text
        };

        if (imageFile.value != '') {
          updateProduct(imageFile.value, data);
          return;
        } else {
          updateProduct('', data);
          return;
        }
      }
    }
  }

  Future<void> storeProduct(String imagePath, Map<String, String> data) async {
    isLoadingStore.value = true;
    final responseApi = await apiService.storeProduct(imagePath, data);
    isLoadingStore.value = false;

    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      Get.snackbar('Sukses', 'Berhasil menambahkan produk baru');
      productModelList.clear();

      resetStateStore();
      await getProductData();

      return;
    } else {
      Get.snackbar('Gagal', responseApi.message.toString());
      return;
    }
  }

  Future<void> updateProduct(String imagePath, Map<String, String> data) async {
    isLoadingStore.value = true;
    final responseApi = await apiService.updateProduct(imagePath, data);
    isLoadingStore.value = false;

    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      Get.snackbar('Sukses', 'Berhasil mengubah data');
      productModelList.clear();

      resetStateStore();
      await getProductData();

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
    productModel = ProductModel();
    isEditable.value = false;
    productId = 0;
  }

  String cleanCurrencyFormat(String currency) {
    // Menghapus 'Rp. ' dan semua titik
    String noRp = currency.replaceAll('Rp. ', '').replaceAll('.', '');
    // Menghapus koma dan semua setelahnya
    String cleanNumber = noRp.split(',')[0];

    return cleanNumber;
  }

  Future<void> destroy(int productId) async {
    final responseApi = await apiService.destroyProduct(productId);
    if (responseApi.responsestate == Constants.SUCCESS_STATE) {
      Get.snackbar('Berhasil', 'Produk berhasil di hapus');

      productModelList.clear();

      await getProductData();
    } else {
      Get.snackbar('Error', responseApi.message.toString());
      return;
    }
  }

  void setProductEdit() {
    if (productModel != '') {
      isEditable.value = true;
      namaProductController.text = productModel.nama_produk.toString();
      merkProductController.text = productModel.merk.toString();
      hrgBeliProductController.text = productModel.harga_beli.toString();
      hrgJualProductController.text = productModel.harga_jual.toString();
      diskonProductController.text = productModel.diskon.toString();
      stokProductController.text = productModel.stok.toString();
      productId = productModel.id_produk;
      return;
    }

    return;
  }
}

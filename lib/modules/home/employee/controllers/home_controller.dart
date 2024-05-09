import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pos_app/core/models/category/kategori_model.dart';
import 'package:pos_app/core/models/member/member_model.dart';
import 'package:pos_app/core/models/penjualan/penjualan_model.dart';
import 'package:pos_app/core/models/penjualan_detail/penjualan_detail_model.dart';
import 'package:pos_app/core/models/product/product_model.dart';
import 'package:pos_app/core/services/app_service.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/services/user_service.dart';
import 'package:pos_app/core/util/constans.dart';
import 'package:pos_app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxList<dynamic> foodList = [].obs;
  RxBool isLoadingProduct = true.obs;
  RxList<KategoriModel> kategoryModelList = <KategoriModel>[].obs;
  RxList<ProductModel> productModelList = <ProductModel>[].obs;
  RxList<ProductModel> orderList = <ProductModel>[].obs;
  final apiService = Get.put(ApiService());
  RxList<PenjualanDetailModel> penjualanDetailModelList =
      <PenjualanDetailModel>[].obs;
  Map<int, TextEditingController> controllerStock = {};
  RxBool isLoadingMember = false.obs;
  final appService = Get.put(AppService());
  TextEditingController controllerDiskon = TextEditingController();
  TextEditingController controllerDiterima = TextEditingController();
  TextEditingController controllerKembalian = TextEditingController();
  RxInt memberId = 0.obs;
  RxList<MemberModel> memberList = <MemberModel>[].obs;
  RxInt totalTransaction = 0.obs;
  RxBool isLoadingTransaction = false.obs;
  final userService = Get.put(UserService());
  int totalDiterima = 0;
  int totalHarga = 0;
  RxInt disscount = 0.obs;
  RxList<ProductModel> productModelList2 = <ProductModel>[].obs;

  Future<void> initCategory() async {
    try {
      final getCategory = await apiService.getCategory();
      if (getCategory.responsestate == Constants.SUCCESS_STATE) {
        kategoryModelList.addAll(getCategory.data);
        print(kategoryModelList.value.toString());
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
          setupControllers();
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
        print('berhasul get produk');
        setupControllers();
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

  void setupControllers() {
    for (var order in penjualanDetailModelList) {
      controllerStock[order.id_produk] =
          TextEditingController(text: order.jumlah.toString());
    }
  }

  Future<void> addProduct(ProductModel productModel) async {
    var index = penjualanDetailModelList
        .indexWhere((element) => element.id_produk == productModel.id_produk);
    // jika stok produk habis
    if (productModel.stok <= 0) {
      Get.snackbar('Error', 'Produk telah habis');
      return;
    }

    if (index != -1) {
      var productSelected = penjualanDetailModelList[index];

      // jiika stok produk lebih kecil
      if (productSelected.jumlah + 1 > productModel.stok) {
        Get.snackbar('Error', 'Stok produk tidak cukup');
        return;
      }
      var updatedProduct = productSelected.copyWith(
        jumlah: productSelected.jumlah + 1,
        subtotal: productSelected.harga_jual * (productSelected.jumlah + 1),
      );
      penjualanDetailModelList[index] =
          updatedProduct; // Memperbarui entri di list
      penjualanDetailModelList.refresh();

      // uodate controller jumllah produk
      controllerStock[productModel.id_produk] = TextEditingController(
        text: updatedProduct.jumlah.toString(),
      ); // Memperbarui UI jika diperlukan

      print('menambahkan produk yg telah ada');
      print('daftar chart ${penjualanDetailModelList.value.toString()}');
      return;
    }
    // Jika produk tidak ditemukan, tambahkan sebagai produk baru
    final newProductSelected = PenjualanDetailModel(
      id_produk: productModel.id_produk,
      productName: productModel.nama_produk,
      harga_jual: productModel.harga_jual,
      jumlah: 1,
      total_stock: productModel.stok,
      subtotal: productModel.harga_jual,
    );
    penjualanDetailModelList.add(newProductSelected);
    controllerStock[productModel.id_produk] = TextEditingController(
      text: newProductSelected.jumlah.toString(),
    );
    update(); // Memperbarui UI
    print('menambahkan produk baru');
  }

  Future<void> editQty(
      PenjualanDetailModel penjualanDetailModel, int qty) async {
    isLoadingMember.value = true;
    var index = penjualanDetailModelList.indexWhere(
        (element) => element.id_produk == penjualanDetailModel.id_produk);
    // jika stok produk habis
    if (penjualanDetailModel.total_stock <= 0) {
      Get.snackbar('Error', 'Produk telah habis');
      return;
    }

    if (index != -1) {
      var productSelected = penjualanDetailModelList[index];

      // jiika stok produk lebih kecil
      if (qty > penjualanDetailModel.total_stock) {
        Get.snackbar('Error', 'Stok produk tidak cukup');
        return;
      }
      var updatedProduct = productSelected.copyWith(
        jumlah: qty,
        subtotal: productSelected.harga_jual * qty,
      );
      penjualanDetailModelList[index] =
          updatedProduct; // Memperbarui entri di list
      penjualanDetailModelList.refresh();

      // uodate controller jumllah produk
      controllerStock[penjualanDetailModel.id_produk] = TextEditingController(
        text: qty.toString(),
      ); // Memperbarui UI jika diperlukan

      print('menambahkan produk yg telah ada');
      print('daftar chart ${penjualanDetailModelList.value.toString()}');
      isLoadingMember.value = false;

      return;
    }
  }

  void deleteProduct(int index) {
    penjualanDetailModelList.removeAt(index);
  }

  Future<void> resetOrder() async {
    penjualanDetailModelList.clear();
    penjualanDetailModelList.refresh();
  }

  Future<bool> countTransaction() async {
    controllerDiskon.text = '0';
    controllerKembalian.text = '0';
    controllerDiterima.text = '0';
    memberId.value = 0;
    disscount.value = 0;

    try {
      await getMember();
      if (!penjualanDetailModelList.isEmpty) {
        totalTransaction.value = 0;
        totalHarga = 0;
        for (var element in penjualanDetailModelList) {
          totalTransaction.value += element.subtotal;
          totalHarga += element.subtotal;
        }
        print('total transaksi: ${totalTransaction.value}');
        return true;
      }
      Get.snackbar('Error', 'Terjadi kesalahan');
      return false;
    } catch (e) {
      Get.snackbar('Error', 'Gagal membuat transaksi');
      return false;
    }
  }

  Future<void> getMember() async {
    isLoadingMember.value = true;
    final getMember = await apiService.getMember();
    isLoadingMember.value = false;
    if (getMember.responsestate == Constants.SUCCESS_STATE) {
      memberList.value = getMember.data;
    } else {
      Get.snackbar('Erorr', getMember.message.toString());
      memberList.value = [];
    }
  }

  Future<void> countExchange(String value) async {
    totalDiterima = cleanCurrencyFormat(value);
    int kembalian = totalDiterima - totalTransaction.value;
    controllerKembalian.text = formatRupiah(kembalian);
  }

  void countDiscount() {
    if (memberId.value == 0) {
      int discount = appService.appModel.value.diskon;
      disscount.value = discount;
      totalTransaction.value =
          countTotalWithDiscount(totalTransaction.value, discount);
      return;
    }
  }

  Future<void> transactionValidation() async {
    // try {

    // } catch (e) {
    //   isLoadingTransaction.value = false;
    //   Get.snackbar('Error', 'Gagal membuat transaksi');
    //   print(e.toString());
    //   return;
    // }

    await userService.initSharedPref();
    int userId = await userService.getPrefInt(Constants.USER_ID);
    int id_member = memberId.value;
    int totalItem = countTotalItem();

    if (userId == 0) {
      Get.snackbar('Error', 'Anda tidak memilki akses');
      print('user id not found');

      return;
    }

    if (totalItem == 0) {
      Get.snackbar('Error', 'Total produk tidak valid');

      return;
    }

    if (totalHarga == 0) {
      Get.snackbar('Error', 'Total produk tidak valid');

      return;
    }

    if (penjualanDetailModelList.isEmpty) {
      Get.snackbar('Error', 'Order item tidak boleh kosong');

      return;
    }

    if (controllerDiterima.text == '' || controllerDiterima.text.isEmpty) {
      Get.snackbar('Error', 'Nominal diterima tidak boleh kosong');
      return;
    }
    int totalDiterima = cleanCurrencyFormat(controllerDiterima.text);

    if (totalDiterima == 0) {
      Get.snackbar('Error', 'Total diterima tidak valid');

      return;
    }

    if (totalTransaction > totalDiterima) {
      Get.snackbar('Error', 'Nominal pembayaran kurang');

      return;
    }

    // prepare send data transaction

    final PenjualanModel penjualanModel = PenjualanModel(
        id_member: id_member,
        total_item: totalItem,
        total_harga: totalHarga,
        diskon: disscount.value,
        bayar: totalTransaction.value,
        diterima: totalDiterima,
        id_user: userId);

    Map<String, dynamic> dataTransaction = {
      'penjualan': penjualanModel.toJson(),
      'penjualan_detail':
          penjualanDetailModelList.map((element) => element.toJson()).toList(),
    };

    isLoadingTransaction.value = true;

    await storeTransaction(dataTransaction);

    return;
  }

  Future<void> storeTransaction(Map<String, dynamic> map) async {
    final responseApiModel = await apiService.storeTransaction(map);
    isLoadingTransaction.value = false;
    final PenjualanModel penjualanModel = responseApiModel.data;

    if (responseApiModel.responsestate == Constants.SUCCESS_STATE) {
      await resetState(penjualanModel.id_penjualan);
      print(penjualanModel.id_penjualan);
      return;
    } else {
      Get.snackbar('Gagal', responseApiModel.message.toString());
      return;
    }
  }

  int countTotalItem() {
    int totalitem = 0;
    for (var element in penjualanDetailModelList) {
      totalitem += element.jumlah;
    }
    return totalitem;
  }

  int countTotalWithDiscount(int hargaAwal, int diskonPersen) {
    // Menghitung harga setelah diskon
    int hargaSetelahDiskon =
        (hargaAwal - (diskonPersen / 100 * hargaAwal)).round();
    return hargaSetelahDiskon;
  }

  Future<void> store(Map<String, dynamic> map) async {}

  int cleanCurrencyFormat(String currency) {
    // Menghapus 'Rp. ' dan semua titik
    String noRp = currency.replaceAll('Rp. ', '').replaceAll('.', '');
    // Menghapus koma dan semua setelahnya
    String cleanNumber = noRp.split(',')[0];

    return int.parse(cleanNumber);
  }

  String formatRupiah(int number) {
    String currency = 'Rp. ';
    String formattedNumber = number.toString();
    String result = '';

    while (formattedNumber.length > 3) {
      result =
          '.' + formattedNumber.substring(formattedNumber.length - 3) + result;
      formattedNumber =
          formattedNumber.substring(0, formattedNumber.length - 3);
    }
    result = formattedNumber + result;

    return currency + result;
  }

  Future resetState(int penjualanId) async {
    Get.delete<HomeController>();
    await Future.delayed(Duration.zero); // Menambahkan penundaan
    if (penjualanId > 1) {
      Get.offAllNamed(
        Routes.SUCCESS_PAGE,
        arguments: {'penjualan_id': penjualanId},
      );
    }
  }
}

import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/services/remote/end_point.dart';
import 'package:pos_app/modules/product/bindings/product_binding.dart';
import 'package:pos_app/modules/product/controllers/product_controller.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    ProductBinding().dependencies;
    controller.resetStateStore();

    controller.getProductData();
    controller.getCategory();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Produk',
                          style: TextStyle(fontFamily: 'popsem', fontSize: 20),
                        ),
                        subtitle: Text(
                          'Halaman untuk menambahkan produk baru.',
                          style: TextStyle(fontFamily: 'popreg', fontSize: 10),
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          controller.searchProduct(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Cari produk',
                          prefixIcon: Icon(Icons.search),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      if (controller.isLoadingProduct.value)
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.blue[50],
                            color: Colors.blue,
                          ),
                        )
                      else if (controller.productModelList.value.isEmpty)
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Tidak ada data.',
                            style: TextStyle(
                              fontFamily: 'popmed',
                              fontSize: 6.sp,
                              color: Colors.black,
                            ),
                          ),
                        )
                      else
                        ListView.builder(
                          padding: EdgeInsets.only(top: 20.h),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.productModelList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var productList =
                                controller.productModelList.value[index];
                            return GestureDetector(
                              onTap: () {
                                controller.productModel = productList;
                                controller.setProductEdit();
                                print(controller.productModel.toString());
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Image.network(
                                  '${EndPoint.base_url_product_image + productList.img!}',
                                  errorBuilder: (context, error, stackTrace) {
                                    print(error.toString());
                                    return Icon(Icons.error);
                                  },
                                ),
                                title: Text(
                                  productList.nama_produk.toString(),
                                  style: TextStyle(
                                      fontFamily: 'popmed',
                                      color: Colors.black,
                                      fontSize: 6.sp),
                                ),
                                subtitle: Text(
                                  'X${productList.stok.toString()}',
                                  style: TextStyle(
                                      fontFamily: 'popreg',
                                      color: Colors.blue,
                                      fontSize: 6.sp),
                                ),
                                trailing: GestureDetector(
                                  onTap: () async {
                                    await controller
                                        .destroy(productList.id_produk);
                                  },
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Container(
                                      color: Colors.red[50],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          CupertinoIcons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(20),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.h, right: 10.w),
                width: 120.w,
                child: controller.isLoadingCategory.value
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blue[50],
                          color: Colors.blue,
                        ),
                      )
                    : controller.categoryModelList.isEmpty
                        ? Center(
                            child: Center(
                              child: Text(
                                'Gagal memuat kategori.',
                                style: TextStyle(
                                    fontFamily: 'popmed',
                                    fontSize: 6.sp,
                                    color: Colors.grey),
                              ),
                            ),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.isEditable.value
                                      ? "Ubah Data Produk"
                                      : "Tambah Produk Baru",
                                  style: TextStyle(
                                      fontFamily: 'popsem', fontSize: 8.sp),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                TextField(
                                  controller: controller.namaProductController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'popmed',
                                      fontSize: 6.sp,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Nama produk',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                DropdownSearch<String>(
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      baseStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'popmed',
                                        fontSize: 6.sp,
                                      ),
                                      dropdownSearchDecoration: InputDecoration(
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'popmed',
                                          fontSize: 6.sp,
                                        ),
                                        labelText: "Pilih kategori",
                                        labelStyle: TextStyle(
                                            fontFamily: 'popmed',
                                            fontSize: 5.sp,
                                            color: Colors.black),
                                        hintText: "Ketik atau pilih kategori",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Menambahkan border radius pada spinner
                                        ),
                                      ),
                                    ),
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      searchFieldProps: TextFieldProps(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'popmed',
                                          fontSize: 6.sp,
                                        ),
                                        decoration: InputDecoration(
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'popmed',
                                            fontSize: 6.sp,
                                          ),
                                          hintText: 'Kategori',
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.always,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          labelText: 'Cari kategori',
                                        ),
                                      ),
                                      showSelectedItems: true,
                                      menuProps: MenuProps(
                                        shape: RoundedRectangleBorder(
                                          // Menambahkan border radius pada menu
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                      ),
                                    ),
                                    itemAsString: (String itemId) {
                                      final categoryName = controller
                                          .categoryModelList
                                          .firstWhere((item) =>
                                              item.id_kategori.toString() ==
                                              itemId)
                                          .nama_kategori;
                                      return categoryName!;
                                    },
                                    items: controller.categoryModelList.value
                                        .map((item) =>
                                            item.id_kategori.toString())
                                        .toList(),
                                    onChanged: (value) {
                                      controller.kategoriId = value.toString();
                                      // controller.countDiscount();
                                      // controller.memberId.value = int.parse(value!);
                                    }),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextField(
                                  controller: controller.merkProductController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'popmed',
                                      fontSize: 6.sp,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Merk',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextField(
                                  controller:
                                      controller.hrgBeliProductController,
                                  inputFormatters: [
                                    CurrencyTextInputFormatter.currency(
                                      locale: 'ID',
                                      decimalDigits: 0,
                                      symbol: 'Rp. ',
                                    ),
                                  ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'popmed',
                                      fontSize: 6.sp,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Harga beli',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextField(
                                  controller:
                                      controller.hrgJualProductController,
                                  inputFormatters: [
                                    CurrencyTextInputFormatter.currency(
                                      locale: 'ID',
                                      decimalDigits: 0,
                                      symbol: 'Rp. ',
                                    ),
                                  ],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'popmed',
                                      fontSize: 6.sp,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Harga jual',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  controller:
                                      controller.diskonProductController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'popmed',
                                      fontSize: 6.sp,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Diskon',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextField(
                                  keyboardType: TextInputType.number,
                                  controller: controller.stokProductController,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'popmed',
                                      fontSize: 6.sp,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Stok',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                if (controller.isEditable.value &&
                                    controller.imageFile.value == '')
                                  SizedBox(
                                      width: 60.w,
                                      height: 60.h,
                                      child: Image.network(
                                        '${EndPoint.base_url_product_image + controller.productModel.img.toString()}',
                                      ))
                                else if (controller.imageFile.value != '')
                                  SizedBox(
                                    width: 60.w,
                                    height: 60.h,
                                    child: Image.file(
                                        File(controller.imageFile.value)),
                                  )
                                else
                                  Container(),
                                TextButton(
                                  onPressed: () async {
                                    await controller.getImage();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Colors.green[50],
                                    ),
                                  ),
                                  child: Text(
                                    'Pilih gambar',
                                    style: TextStyle(
                                      fontFamily: 'popmed',
                                      fontSize: 6.sp,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Stack(
                                  children: [
                                    controller.isLoadingStore.value == true
                                        ? Align(
                                            alignment: Alignment.topRight,
                                            child: CircularProgressIndicator(
                                              backgroundColor: Colors.blue[50],
                                              color: Colors.blue,
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  controller.resetStateStore();
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                    Colors.red[50],
                                                  ),
                                                ),
                                                child: Text(
                                                  'Reset data',
                                                  style: TextStyle(
                                                    fontFamily: 'popmed',
                                                    fontSize: 6.sp,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  controller.inputValidation();
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                    Colors.blue[50],
                                                  ),
                                                ),
                                                child: Text(
                                                  'Simpan data',
                                                  style: TextStyle(
                                                    fontFamily: 'popmed',
                                                    fontSize: 6.sp,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                  ],
                                )
                              ],
                            ),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

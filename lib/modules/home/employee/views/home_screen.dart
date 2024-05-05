import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/util/constans.dart';
import 'package:pos_app/modules/home/employee/bindings/home_binding.dart';
import 'package:pos_app/modules/home/employee/controllers/home_controller.dart';
import 'package:pos_app/modules/dashboard/employee/views/dashboard_employee.dart';
import 'package:pos_app/routes/app_pages.dart';
import 'package:pos_app/styles/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

  String truncateString(String input) {
    if (input.length > 15) {
      return input.substring(0, 15) + '...';
    }
    return input;
  }

  String getFormattedDate() {
    // Inisialisasi data lokal
    DateTime now = DateTime.now();
    return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    HomeBinding().dependencies;
    controller.getProduct();
    final appService = controller.appService.appModel.value;
    print('nama perusahaan: ${appService.nama_perusahaan}');

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          appService.nama_perusahaan,
                          style: TextStyle(fontFamily: 'popsem', fontSize: 20),
                        ),
                        subtitle: Text(
                          getFormattedDate(),
                          style: TextStyle(fontFamily: 'popreg', fontSize: 10),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Pilih produk",
                        style: TextStyle(fontFamily: 'popsem', fontSize: 12),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      controller.isLoadingProduct.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: StylesApp.primaryColor,
                              ),
                            )
                          : controller.productModelList.value.length < 0
                              ? Center(
                                  child: Text(
                                    'Tidak ada produk',
                                    style: TextStyle(
                                        fontFamily: 'popmed',
                                        fontSize: 6.sp,
                                        color: Colors.black),
                                  ),
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0,
                                    mainAxisExtent: 200,
                                    mainAxisSpacing: 8.0,
                                  ),
                                  itemCount:
                                      controller.productModelList.value.length,
                                  itemBuilder: (context, index) {
                                    var productItem = controller
                                        .productModelList.value[index];
                                    return GestureDetector(
                                        onTap: () {
                                          controller.addProduct(productItem);
                                        },
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                              child: Container(
                                                  padding: EdgeInsets.all(5.w),
                                                  color: Colors.grey[200],
                                                  width: 100.w,
                                                  height: 200.h,
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        'assets/img/food_example.png',
                                                        width: 80.w,
                                                        height: 80.h,
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Text(
                                                        truncateString(
                                                            productItem
                                                                .nama_produk
                                                                .toString()),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'popmed',
                                                            fontSize: 6.sp),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Text(
                                                        formatRupiah(productItem
                                                            .harga_jual),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'popreg',
                                                            fontSize: 6.sp),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      productItem.stok == 0
                                                          ? Text(
                                                              'Habis',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'popreg',
                                                                  fontSize:
                                                                      6.sp,
                                                                  color: Colors
                                                                      .red),
                                                            )
                                                          : Text(
                                                              'x${productItem.stok.toString()}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'popreg',
                                                                  fontSize:
                                                                      6.sp),
                                                            ),
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ));
                                  },
                                ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(20),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.w, right: 10.w),
                width: 120.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daftar Pesanan",
                      style: TextStyle(fontFamily: 'popsem', fontSize: 15),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.penjualanDetailModelList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var orderList =
                              controller.penjualanDetailModelList.value[index];

                          // controller.foodList.isEmpty ?

                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              orderList.productName.toString(),
                              style: TextStyle(
                                  fontFamily: 'popmed',
                                  fontSize: 6.sp,
                                  color: Colors.black),
                            ),
                            subtitle: SizedBox(
                              width: double.infinity,
                              height: 40
                                  .h, // Added height to prevent crash due to unbounded height
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('X'),
                                  SizedBox(width: 5.w),
                                  SizedBox(
                                    width: 35.w,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        int? parsedValue = int.tryParse(value);
                                        if (parsedValue == null) {
                                          return;
                                        }
                                        if (parsedValue == 0) {
                                          Get.snackbar(
                                              'Error', 'Invalid input');
                                          controller
                                                  .controllerStock[
                                                      orderList.id_produk]
                                                  ?.text =
                                              orderList.total_stock.toString();
                                          return;
                                        }
                                        if (parsedValue >
                                            orderList.total_stock) {
                                          Get.snackbar('Error',
                                              'Stok produk tidak cukup');
                                          controller
                                                  .controllerStock[
                                                      orderList.id_produk]
                                                  ?.text =
                                              orderList.total_stock.toString();
                                          return;
                                        }
                                        Future.delayed(Duration(seconds: 1),
                                            () async {
                                          await controller.editQty(
                                              orderList, parsedValue);
                                        });
                                      },
                                      maxLines: 1,
                                      controller: controller
                                          .controllerStock[orderList.id_produk],
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 0,
                                            top: 0,
                                            bottom: 0,
                                            right: 0),
                                        hintText: '',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: StylesApp.primaryColor,
                                              width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                controller.deleteProduct(index);
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red[300],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    controller.penjualanDetailModelList.isEmpty
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      elevation: MaterialStatePropertyAll(0),
                                      backgroundColor:
                                          MaterialStatePropertyAll(Colors.red)),
                                  onPressed: () {
                                    controller.resetOrder();
                                  },
                                  child: Text(
                                    'Batal',
                                    style: TextStyle(
                                        fontFamily: 'popmed',
                                        color: Colors.white,
                                        fontSize: 5.sp),
                                  ),
                                ),
                                controller.isLoadingMember.value
                                    ? CircularProgressIndicator(
                                        color: StylesApp.primaryColor,
                                      )
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                            elevation:
                                                MaterialStateProperty.all(0),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    StylesApp.primaryColor)),
                                        onPressed: () async {
                                          final bool isValid = await controller
                                              .countTransaction();
                                          if (isValid) {
                                            Get.bottomSheet(
                                              bottom_sheet_transaction(
                                                  controller),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'Proses',
                                          style: TextStyle(
                                              fontFamily: 'popmed',
                                              color: Colors.black,
                                              fontSize: 5.sp),
                                        ),
                                      ),
                              ],
                            )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect bottom_sheet_transaction(HomeController controller) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.only(right: 10.w, top: 10.w, left: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'popmed',
                            fontSize: 5.sp),
                      ),

                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        formatRupiah(controller.totalTransaction.value),
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'popsem',
                            fontSize: 10.sp),
                      ),
                      // SizedBox(
                      //   height: 100.h,
                      //   child: ListView.builder(
                      //     physics: NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: penjualanDetailModel.length,
                      //     itemBuilder: (context, index) {
                      //       var orderList = penjualanDetailModel[index];
                      //       return ListTile(
                      //         leading: Icon(Icons.add_box),
                      //         title: Text('dsdsd'),
                      //       );
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail Pembayaran',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'popmed',
                              fontSize: 5.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        DropdownSearch<String>(
                            dropdownDecoratorProps: DropDownDecoratorProps(
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
                                labelText: "Pilih member",
                                hintText: "Ketik atau pilih member",
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
                                  hintText: 'Nama member',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Cari member',
                                ),
                              ),
                              showSelectedItems: true,
                              menuProps: MenuProps(
                                shape: RoundedRectangleBorder(
                                  // Menambahkan border radius pada menu
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                            ),
                            itemAsString: (String itemId) {
                              final memberName = controller.memberList
                                  .firstWhere((item) =>
                                      item.id_member.toString() == itemId)
                                  .nama;
                              return memberName!;
                            },
                            items: controller.memberList.value
                                .map((item) => item.id_member.toString())
                                .toList(),
                            onChanged: (value) {
                              controller.controllerDiskon.text = controller
                                  .appService.appModel.value.diskon
                                  .toString();
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextField(
                          controller: controller.controllerDiskon,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: 'popmed',
                              fontSize: 6.sp,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Diskon', // Added label

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: StylesApp.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextField(
                          inputFormatters: [
                            CurrencyTextInputFormatter.currency(
                              locale: 'ID',
                              decimalDigits: 0,
                              symbol: 'Rp. ',
                            ),
                          ],
                          onChanged: (value) {
                            Future.delayed(Duration(seconds: 1), () async {
                              await controller.countExchange();
                            });
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: 'popmed',
                              fontSize: 6.sp,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Diterima',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: StylesApp.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextField(
                          readOnly: true,
                          inputFormatters: [
                            CurrencyTextInputFormatter.currency()
                          ],
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: 'popmed',
                              fontSize: 6.sp,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Kembali',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: StylesApp.primaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/modules/report/bindings/report_binding.dart';
import 'package:pos_app/modules/report/controllers/report_controller.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportController());
    ReportBinding().dependencies();
    controller.controllerDate.text =
        '${controller.tglAwal()}  s/d ${controller.tglSekarang()}';

    controller.getReport(controller.tglAwal(), controller.tglSekarang());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue[50],
                    color: Colors.blue,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Laporan',
                            style:
                                TextStyle(fontFamily: 'popsem', fontSize: 20),
                          ),
                          subtitle: Text(
                            'Halaman untuk melihat laporan transaksi.',
                            style:
                                TextStyle(fontFamily: 'popreg', fontSize: 10),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 150.w,
                          child: GestureDetector(
                            onTap: () {
                              if (controller.isLoadingDatePicker.value) {
                                controller.isLoadingDatePicker.value = false;
                                return;
                              } else {
                                controller.isLoadingDatePicker.value = true;
                                return;
                              }
                            },
                            child: TextField(
                              enabled: false,
                              controller: controller.controllerDate,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  CupertinoIcons.calendar,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'popmed',
                                  fontSize: 3.sp,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
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
                          ),
                        ),
                        controller.isLoadingDatePicker.value
                            ? SizedBox(
                                width: 300,
                                height: 400,
                                child: RangeDatePicker(
                                  centerLeadingDate: true,
                                  minDate: DateTime(1),
                                  maxDate: DateTime(9999), //
                                  currentDateTextStyle:
                                      TextStyle(fontSize: 4.sp),
                                  enabledCellsTextStyle: TextStyle(
                                      fontSize: 6.sp,
                                      fontFamily: 'popmed',
                                      color: Colors.black),
                                  leadingDateTextStyle: TextStyle(
                                      fontSize: 7.sp,
                                      fontFamily: 'popsem',
                                      color: Colors.blue),
                                  daysOfTheWeekTextStyle: TextStyle(
                                      fontFamily: 'popmed',
                                      fontSize: 7.sp,
                                      color: Colors.grey),
                                  onRangeSelected: (value) async {
                                    print(value.toString());
                                    controller.controllerDate.text =
                                        value.toString();
                                    controller.isLoadingDatePicker.value =
                                        false;
                                    await controller
                                        .formatDate(value.toString());
                                  },
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Table(
                          border: TableBorder.all(),
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                              ),
                              children: [
                                Text(
                                  'No.',
                                  style: TextStyle(
                                      fontFamily: 'popsem',
                                      color: Colors.green,
                                      fontSize: 6.sp),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Tanggal',
                                  style: TextStyle(
                                      fontFamily: 'popsem',
                                      color: Colors.green,
                                      fontSize: 6.sp),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Penjualan',
                                  style: TextStyle(
                                      fontFamily: 'popsem',
                                      color: Colors.green,
                                      fontSize: 6.sp),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Pembelian',
                                  style: TextStyle(
                                      fontFamily: 'popsem',
                                      color: Colors.green,
                                      fontSize: 6.sp),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Pengeluaran',
                                  style: TextStyle(
                                      fontFamily: 'popsem',
                                      color: Colors.green,
                                      fontSize: 6.sp),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Pendapatan',
                                  style: TextStyle(
                                      fontFamily: 'popsem',
                                      color: Colors.green,
                                      fontSize: 6.sp),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            for (int i = 0;
                                i < controller.reportModelList.value.length;
                                i++)
                              TableRow(children: [
                                Text(
                                  (i + 1).toString(),
                                  style: TextStyle(
                                      fontFamily: 'popmed',
                                      fontSize: 5.sp,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  controller.reportModelList.value[i].tanggal
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'popmed',
                                      fontSize: 5.sp,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  controller.reportModelList.value[i].penjualan
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'popmed',
                                      fontSize: 5.sp,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  controller.reportModelList.value[i].pembelian
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'popmed',
                                      fontSize: 5.sp,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  controller
                                      .reportModelList.value[i].pengeluaran
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'popmed',
                                      fontSize: 5.sp,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  controller.reportModelList.value[i].pendapatan
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'popmed',
                                      fontSize: 5.sp,
                                      color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                              ])
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

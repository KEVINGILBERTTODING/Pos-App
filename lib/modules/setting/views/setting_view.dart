import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/modules/setting/bindings/setting_binding.dart';
import 'package:pos_app/modules/setting/controllers/setting_controller.dart';
import 'package:pos_app/styles/styles.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    SettingBinding().dependencies;
    controller.getData();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Obx(() => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue[50],
                    color: Colors.blue,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(right: 10.w, left: 10.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Pengaturan',
                            style:
                                TextStyle(fontFamily: 'popsem', fontSize: 20),
                          ),
                          subtitle: Text(
                            "Halaman untuk mengubah pengaturan aplikasi.",
                            style:
                                TextStyle(fontFamily: 'popreg', fontSize: 10),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    controller.companyNameFieldController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    fontFamily: 'popmed', fontSize: 7.sp),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    CupertinoIcons.building_2_fill,
                                    weight: 2.0,
                                  ),
                                  focusColor: StylesApp.primaryColor,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: StylesApp.primaryColor,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller:
                                    controller.companyDiscFieldController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: 'popmed', fontSize: 7.sp),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.price_change),
                                  focusColor: StylesApp.primaryColor,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: StylesApp.primaryColor,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                    controller.companyAddressFieldController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 4,
                                minLines: 4,
                                style: TextStyle(
                                    fontFamily: 'popmed', fontSize: 7.sp),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    CupertinoIcons.home,
                                    weight: 2.0,
                                  ),
                                  focusColor: StylesApp.primaryColor,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: StylesApp.primaryColor,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller:
                                    controller.companyTelpFieldController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: 'popmed', fontSize: 7.sp),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.phone),
                                  focusColor: StylesApp.primaryColor,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: StylesApp.primaryColor,
                                        width: 1.0,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Simpan Data',
                                  style: TextStyle(
                                      fontFamily: 'popmed',
                                      color: Colors.blue,
                                      fontSize: 6.sp),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.blue[50],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
        ),
      ),
    );
  }
}

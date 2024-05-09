import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/util/constans.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_app/modules/home/employee/controllers/success_controller.dart';
import 'package:pos_app/modules/home/employee/widgets/modal_nota.dart';
import 'package:pos_app/routes/app_pages.dart';

class SuccessPage extends GetView<SuccessController> {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/anim/success_anim.json',
                  width: 60.w,
                  height: 130.h,
                  fit: BoxFit.fill,
                ),
                Text(
                  Constants.SUCCESS_TRANS_MSG,
                  style: TextStyle(
                      fontFamily: 'popsem',
                      fontSize: 8.sp,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Transaksi berhasil dibuat. Silahkan pilih tombol yang tersedia.',
                  style: TextStyle(
                      fontFamily: 'popreg',
                      fontSize: 5.sp,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.showModalNota();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.amber[50]),
                            elevation: MaterialStatePropertyAll(0),
                          ),
                          child: Text(
                            'Cetak Ulang Nota',
                            style: TextStyle(
                                fontFamily: 'popsem',
                                fontSize: 6.sp,
                                color: Colors.amber),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.DASBOARD_EMPLOYEE);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue[50]),
                            elevation: MaterialStatePropertyAll(0),
                          ),
                          child: Text(
                            'Transaksi Baru',
                            style: TextStyle(
                                fontFamily: 'popsem',
                                fontSize: 6.sp,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

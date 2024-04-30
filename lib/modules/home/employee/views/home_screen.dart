import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/util/constans.dart';
import 'package:pos_app/modules/home/employee/controllers/home_controller.dart';
import 'package:pos_app/styles/styles.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.h),
                width: 30.w,
                child: ListView(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: StylesApp.primaryColor,
                          width: 100.w,
                          height: 50.h,
                          child: Icon(Icons.home_filled),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.grey[200],
                          width: 100.w,
                          height: 50.h,
                          child: Icon(
                            Icons.email,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.grey[200],
                          width: 100.w,
                          height: 50.h,
                          child: Icon(
                            Icons.pie_chart,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.grey[200],
                          width: 100.w,
                          height: 50.h,
                          child: Icon(
                            Icons.settings,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.grey[200],
                          width: 100.w,
                          height: 50.h,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey[500],
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              Expanded(
                child: ListView(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          Constants.APP_NAME,
                          style: TextStyle(fontFamily: 'popsem', fontSize: 20),
                        ),
                        subtitle: Text(
                          "Tuesday, 1 May 2024",
                          style: TextStyle(fontFamily: 'popreg', fontSize: 10),
                        ),
                        // trailing: SizedBox(
                        //   child: TextFormField(
                        //     decoration: InputDecoration(hintText: "Cari produk"),
                        //   ),
                        // ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ChoiceChip(label: Text("Hot dishes"), selected: true),
                          ChoiceChip(
                              label: Text("Hot dishes"), selected: false),
                          ChoiceChip(
                              label: Text("Hot dishes"), selected: false),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Choose Dishes",
                        style: TextStyle(fontFamily: 'popsem', fontSize: 12),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisExtent: 200,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                controller.addProduct(
                                    "Healthy noodle with spinach leaf");
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
                                              "Healthy noodle with spinach leaf",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'popmed',
                                                  fontSize: 6.sp),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              "Rp. 34.000",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'popreg',
                                                  fontSize: 6.sp),
                                            )
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
                      "Orders #34562",
                      style: TextStyle(fontFamily: 'popsem', fontSize: 15),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: controller.foodList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var orderList = controller.foodList.value[index];

                          // controller.foodList.isEmpty ?

                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              orderList,
                              style: TextStyle(
                                  fontFamily: 'popreg',
                                  fontSize: 7.sp,
                                  color: Colors.black),
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
                    controller.foodList.isEmpty
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      StylesApp.primaryColor)),
                              onPressed: () {},
                              child: Text(
                                'Simpan transaksi',
                                style: TextStyle(
                                    fontFamily: 'popmed',
                                    color: Colors.black,
                                    fontSize: 5.sp),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

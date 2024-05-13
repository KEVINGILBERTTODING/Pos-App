import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/modules/dashboard/admin/controllers/dashboard_admin_controller.dart';
import 'package:pos_app/modules/dashboard/employee/widget/onrail_admin_menu.dart';
import 'package:pos_app/styles/styles.dart';

class DashboardAdminScreen extends StatelessWidget {
  DashboardAdminScreen({super.key});
  final controller = Get.put(DashboardAdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Show the navigaiton rail if screen width >= 640
            if (MediaQuery.of(context).size.width >= 640)
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: NavigationRail(
                      backgroundColor: Colors.white,
                      minWidth: 20.w,
                      selectedIndex: controller.stateSelectedIndex.value,
                      // Called when one tab is selected
                      onDestinationSelected: (int index) {
                        controller.stateSelectedIndex.value = index;
                        if (index == 7) {
                          Get.dialog(
                            barrierColor: Colors.white,
                            AlertDialog(
                              backgroundColor: Colors.white,
                              title: Text(
                                'Peringatan!',
                                style: TextStyle(
                                    fontFamily: 'popmed',
                                    fontSize: 8.sp,
                                    color: Colors.black),
                              ),
                              content: Text(
                                'Apakah anda yakin ingin keluar?',
                                style: TextStyle(
                                    fontFamily: 'popmed',
                                    fontSize: 6.sp,
                                    color: Colors.black),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Tidak",
                                      style: TextStyle(
                                          fontFamily: 'popmed',
                                          fontSize: 6.sp,
                                          color: Colors.black)),
                                  onPressed: () => Get.back(),
                                ),
                                TextButton(
                                  child: Text(
                                    "Ya, keluar",
                                    style: TextStyle(
                                        fontFamily: 'popmed',
                                        fontSize: 6.sp,
                                        color: Colors.red),
                                  ),
                                  onPressed: () async =>
                                      await controller.logOut(),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      labelType: NavigationRailLabelType.all,
                      selectedLabelTextStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'popmed',
                          fontSize: 5.sp),
                      leading: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      unselectedLabelTextStyle: const TextStyle(),
                      // navigation rail items
                      destinations: const [
                        NavigationRailDestination(
                            icon: Icon(
                              CupertinoIcons.app_badge,
                              weight: 2.0,
                            ),
                            label: Text('Home')),
                        NavigationRailDestination(
                            icon: Icon(
                              CupertinoIcons.shopping_cart,
                              weight: 2.0,
                            ),
                            label: Text('Penjualan')),
                        NavigationRailDestination(
                            icon: Icon(CupertinoIcons.square_favorites),
                            label: Text('Kategori')),
                        NavigationRailDestination(
                            icon: Icon(
                              CupertinoIcons.person_2,
                              weight: 2.0,
                            ),
                            label: Text('Member')),
                        NavigationRailDestination(
                            icon: Icon(CupertinoIcons.cube_box),
                            label: Text('Produk')),
                        NavigationRailDestination(
                            icon: Icon(CupertinoIcons.chart_bar_square),
                            label: Text('Laporan')),
                        NavigationRailDestination(
                            indicatorColor: StylesApp.primaryColor,
                            icon: Icon(CupertinoIcons.person_alt_circle),
                            label: Text('Profil')),
                        NavigationRailDestination(
                            indicatorColor: StylesApp.primaryColor,
                            icon: Icon(CupertinoIcons.arrow_right_circle),
                            label: Text('Keluar')),
                      ],
                    ),
                  ),
                ),
              ),

            // Main content
            // This part is always shown
            // You will see it on both small and wide screen
            Expanded(
                child: AdminOnRailMenu
                    .menuContent[controller.stateSelectedIndex.value]),
          ],
        ),
      ),
    );
  }
}

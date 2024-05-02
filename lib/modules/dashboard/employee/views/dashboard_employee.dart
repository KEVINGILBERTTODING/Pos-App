import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/modules/dashboard/employee/controllers/dashboard_employee_controller.dart';
import 'package:pos_app/modules/dashboard/employee/widget/onrail_menu.dart';
import 'package:pos_app/modules/home/employee/views/home_screen.dart';
import 'package:pos_app/modules/profile/employee/views/employee_profile_view.dart';
import 'package:pos_app/styles/styles.dart';

class DashboardEmployeeScreen extends StatelessWidget {
  DashboardEmployeeScreen({super.key});
  final controller = Get.put(DashboardEmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Show the navigaiton rail if screen width >= 640
            if (MediaQuery.of(context).size.width >= 640)
              NavigationRail(
                // backgroundColor: Colors.grey[200],
                minWidth: 20.w,
                selectedIndex: controller.stateSelectedIndex.value,
                // Called when one tab is selected
                onDestinationSelected: (int index) {
                  controller.stateSelectedIndex.value = index;
                  print(controller.stateSelectedIndex.value);
                },
                labelType: NavigationRailLabelType.all,
                selectedLabelTextStyle: TextStyle(
                    color: Colors.black, fontFamily: 'popmed', fontSize: 5.sp),
                leading: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    // CircleAvatar(
                    //   radius: 20,
                    //   child: Image.asset('assets/img/main_logo.jpeg'),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                  ],
                ),
                unselectedLabelTextStyle: const TextStyle(),
                // navigation rail items
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.apps), label: Text('Home')),
                  NavigationRailDestination(
                      indicatorColor: StylesApp.primaryColor,
                      icon: Icon(Icons.person_outline),
                      label: Text('Profil')),
                  NavigationRailDestination(
                      indicatorColor: StylesApp.primaryColor,
                      icon: Icon(Icons.logout_outlined),
                      label: Text('Keluar')),
                ],
              ),

            // Main content
            // This part is always shown
            // You will see it on both small and wide screen
            Expanded(
                child: EmployeeOnRailMenu
                    .menuContent[controller.stateSelectedIndex.value]),
          ],
        ),
      ),
    );
  }
}

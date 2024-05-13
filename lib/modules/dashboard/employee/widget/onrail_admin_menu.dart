import 'package:flutter/widgets.dart';
import 'package:pos_app/modules/category/views/category_view.dart';
import 'package:pos_app/modules/home/admin/views/home_admin_screen.dart';
import 'package:pos_app/modules/home/employee/views/home_screen.dart';
import 'package:pos_app/modules/member/views/member_view.dart';
import 'package:pos_app/modules/product/views/product_view.dart';
import 'package:pos_app/modules/profile/employee/views/employee_profile_view.dart';
import 'package:pos_app/modules/report/views/report_view.dart';

abstract class AdminOnRailMenu {
  static const List<Widget> menuContent = [
    // Content for Home tab
    HomeAdminScreen(),
    HomeScreen(),
    CategoryView(),
    MemberScreen(),
    ProductScreen(),
    ReportScreen(),
    EmployeeProfileScreen(),
    EmployeeProfileScreen(),
  ];
}

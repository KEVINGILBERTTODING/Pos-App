import 'package:flutter/widgets.dart';
import 'package:pos_app/modules/home/employee/views/home_screen.dart';
import 'package:pos_app/modules/profile/employee/views/employee_profile_view.dart';

abstract class EmployeeOnRailMenu {
  static const List<Widget> menuContent = [
    // Content for Home tab
    HomeScreen(),
    EmployeeProfileScreen()
  ];
}

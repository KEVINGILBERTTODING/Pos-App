import 'package:get/get.dart';
import 'package:pos_app/modules/auth/bindings/auth_binding.dart';
import 'package:pos_app/modules/auth/views/login_view.dart';
import 'package:pos_app/modules/category/binding/category_binding.dart';
import 'package:pos_app/modules/category/views/category_view.dart';
import 'package:pos_app/modules/dashboard/admin/bindings/dashboard_admin_binding.dart';
import 'package:pos_app/modules/dashboard/admin/views/dashboard_admin.dart';
import 'package:pos_app/modules/dashboard/employee/bindings/dashboard_employee_binding.dart';
import 'package:pos_app/modules/home/admin/bindings/home_admin_binding.dart';
import 'package:pos_app/modules/home/admin/views/home_admin_screen.dart';
import 'package:pos_app/modules/home/employee/views/success_page.dart';
import 'package:pos_app/modules/home/employee/bindings/home_binding.dart';
import 'package:pos_app/modules/dashboard/employee/views/dashboard_employee.dart';
import 'package:pos_app/modules/home/employee/bindings/success_binding.dart';
import 'package:pos_app/modules/home/employee/views/home_screen.dart';
import 'package:pos_app/modules/member/bindings/member_binding.dart';
import 'package:pos_app/modules/member/views/member_view.dart';
import 'package:pos_app/modules/profile/employee/bindings/employee_profile_binding.dart';
import 'package:pos_app/modules/profile/employee/views/employee_profile_view.dart';
import 'package:pos_app/modules/report/bindings/report_binding.dart';
import 'package:pos_app/modules/report/views/report_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initialRoutes = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBORD_EMPLOYEE,
      page: () => DashboardEmployeeScreen(),
      // binding: DashboardEmployeeBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_PROFILE,
      page: () => EmployeeProfileScreen(),
      binding: EmployeeProfileBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS_PAGE,
      page: () => SuccessPage(),
      binding: SuccessBinding(),
    ),
    GetPage(
      name: _Paths.DASBOARD_ADMIN,
      page: () => DashboardAdminScreen(),
      // binding: DashboardAdminBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => HomeAdminScreen(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.MEMBER,
      page: () => MemberScreen(),
      binding: MemberBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportScreen(),
      binding: ReportBinding(),
    ),
  ];
}

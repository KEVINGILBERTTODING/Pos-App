part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const DASBOARD_EMPLOYEE = _Paths.DASHBORD_EMPLOYEE;
  static const EMPLOYEE_PROFILE = _Paths.EMPLOYEE_PROFILE;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const DASHBORD_EMPLOYEE = '/dashboard_employee';
  static const EMPLOYEE_PROFILE = '/profile_employee';
}

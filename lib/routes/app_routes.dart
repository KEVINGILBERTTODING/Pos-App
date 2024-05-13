part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const DASBOARD_EMPLOYEE = _Paths.DASHBORD_EMPLOYEE;
  static const EMPLOYEE_PROFILE = _Paths.EMPLOYEE_PROFILE;
  static const SUCCESS_PAGE = _Paths.SUCCESS_PAGE;
  static const DASHBOARD_ADMIN = _Paths.DASBOARD_ADMIN;
  static const HOME_ADMIN = _Paths.HOME_ADMIN;
  static const CATEGORY = _Paths.CATEGORY;
  static const MEMBER = _Paths.MEMBER;
  static const REPORT = _Paths.REPORT;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const DASHBORD_EMPLOYEE = '/dashboard_employee';
  static const EMPLOYEE_PROFILE = '/profile_employee';
  static const SUCCESS_PAGE = '/success_page';
  static const DASBOARD_ADMIN = '/dashboard_admin';
  static const HOME_ADMIN = '/home_admin';
  static const CATEGORY = '/category';
  static const MEMBER = '/member';
  static const REPORT = '/report';
}

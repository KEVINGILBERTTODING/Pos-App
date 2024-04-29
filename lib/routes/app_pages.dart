import 'package:get/get.dart';
import 'package:pos_app/modules/auth/bindings/auth_binding.dart';
import 'package:pos_app/modules/auth/views/login_view.dart';
import 'package:pos_app/modules/home/bindings/home_binding.dart';
import 'package:pos_app/modules/home/views/home_screen.dart';

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
  ];
}

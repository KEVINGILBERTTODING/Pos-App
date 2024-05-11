import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/models/shared_user_model.dart';
import 'package:pos_app/core/services/app_service.dart';
import 'package:pos_app/core/services/user_service.dart';
import 'package:pos_app/core/util/constans.dart';
import 'package:pos_app/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  final userService = await Get.put(UserService());
  final appService = await Get.put(AppService());
  await userService.initSharedPref();
  final sharedUserData = await userService.getSharedUserModel();
  final isLoading = userService.isLoading.value;
  print(sharedUserData.toString());
  initializeDateFormatting('id_ID', null);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(MainApp(
    sharedUserData: sharedUserData,
    isLoading: isLoading,
  ));
}

class MainApp extends StatelessWidget {
  final SharedUserModel sharedUserData;
  final bool isLoading;
  const MainApp(
      {super.key, required this.sharedUserData, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    if (isLoading == false) {
      FlutterNativeSplash.remove();
    }

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return GetMaterialApp(
            initialRoute: sharedUserData.is_login
                ? sharedUserData.role == 1
                    ? Routes.DASHBOARD_ADMIN
                    : Routes.DASBOARD_EMPLOYEE
                : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        });
  }
}

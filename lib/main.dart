import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/models/shared_user_model.dart';
import 'package:pos_app/core/services/user_service.dart';
import 'package:pos_app/core/util/constans.dart';
import 'package:pos_app/routes/app_pages.dart';

void main() async {
  final userService = await Get.put(UserService());
  await userService.initSharedPref();
  final sharedUserData = await userService.getSharedUserModel();
  final isLoading = userService.isLoading.value;
  print(sharedUserData.toString());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
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
    return GetMaterialApp(
      initialRoute: sharedUserData.is_login ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
    );
  }
}

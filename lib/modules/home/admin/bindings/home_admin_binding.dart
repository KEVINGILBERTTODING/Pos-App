import 'package:get/get.dart';

class HomeAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAdminBinding>(() => HomeAdminBinding());
  }
}

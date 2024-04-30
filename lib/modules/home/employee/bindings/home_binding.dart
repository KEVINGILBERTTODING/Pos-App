import 'package:get/get.dart';
import 'package:pos_app/modules/home/employee/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

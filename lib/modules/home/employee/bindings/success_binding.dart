import 'package:get/get.dart';
import 'package:pos_app/modules/home/employee/controllers/success_controller.dart';

class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessController>(() => SuccessController());
  }
}

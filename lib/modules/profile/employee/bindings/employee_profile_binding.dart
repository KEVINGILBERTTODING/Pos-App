import 'package:get/get.dart';
import 'package:pos_app/modules/profile/employee/controllers/employee_profile_controller.dart';

class EmployeeProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeProfileController>(() => EmployeeProfileController());
  }
}

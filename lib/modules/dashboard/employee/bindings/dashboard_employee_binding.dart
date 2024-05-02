import 'package:get/get.dart';
import 'package:pos_app/modules/dashboard/employee/controllers/dashboard_employee_controller.dart';

class DashboardEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardEmployeeController>(
        () => DashboardEmployeeController());
  }
}

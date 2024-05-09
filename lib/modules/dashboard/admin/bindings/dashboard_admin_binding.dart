import 'package:get/get.dart';
import 'package:pos_app/modules/dashboard/admin/controllers/dashboard_admin_controller.dart';

class DashboardAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardAdminController>(() => DashboardAdminController());
  }
}

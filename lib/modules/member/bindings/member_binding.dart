import 'package:get/get.dart';
import 'package:pos_app/modules/member/controllers/member_controller.dart';

class MemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberController>(() => MemberController());
  }
}

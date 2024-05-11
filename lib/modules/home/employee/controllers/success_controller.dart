import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pos_app/core/services/remote/end_point.dart';
import 'package:pos_app/core/services/user_service.dart';
import 'package:pos_app/modules/home/employee/widgets/modal_nota.dart';

class SuccessController extends GetxController {
  final userService = Get.put(UserService());

  int penjualanId = 0;
  @override
  void onInit() {
    if (Get.arguments != null) {
      penjualanId = Get.arguments['penjualan_id'];
    }
    super.onInit();
  }

  void showModalNota() {
    if (penjualanId == 0) {
      Get.snackbar(
        'Error',
        'Gagal mencetak nota',
      );
      return;
    }

    final notaUrl = EndPoint.nota_transaction_endpoint + penjualanId.toString();

    print(notaUrl);
    Get.to(
      ModalNota(
        notaUrl: notaUrl,
      ),
    );
    return;
  }
}

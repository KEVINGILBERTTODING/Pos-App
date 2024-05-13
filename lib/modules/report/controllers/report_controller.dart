import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/models/report/report_model.dart';
import 'package:pos_app/core/services/remote/api_service.dart';
import 'package:pos_app/core/util/constans.dart';

class ReportController extends GetxController {
  final apiService = Get.put(ApiService());
  RxList<ReportModel> reportModelList = <ReportModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingDatePicker = false.obs;
  TextEditingController controllerDate = TextEditingController();

  Future<void> getReport(String tglAwal, String tglAkhir) async {
    reportModelList.clear();
    print('report date: ${tglAwal} s/d ${tglAkhir}');
    isLoading.value = true;
    final responseApiModel = await apiService.getReport(tglAwal, tglAkhir);
    isLoading.value = false;
    if (responseApiModel.responsestate == Constants.SUCCESS_STATE) {
      reportModelList.addAll(responseApiModel.data);
      return;
    } else {
      Get.snackbar('Error', responseApiModel.message.toString());
      return;
    }
  }

  Future<void> formatDate(String dateRange) async {
    List<String> dates = dateRange.split(' - ');
    String dateFrom = dates[0].split(' ')[0];
    String dateEnd = dates[1].split(' ')[0];

    controllerDate.text = '${dateFrom} s/d ${dateEnd}';
    await getReport(dateFrom, dateEnd);

    return;
  }

  String tglSekarang() {
    DateTime now = DateTime.now();
    String formattedDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    return formattedDate;
  }

  String tglAwal() {
    DateTime now = DateTime.now();
    String formattedDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-01';
    return formattedDate;
  }
}

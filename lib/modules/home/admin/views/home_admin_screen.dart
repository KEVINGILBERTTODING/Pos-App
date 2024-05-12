import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos_app/modules/home/admin/bindings/home_admin_binding.dart';
import 'package:pos_app/modules/home/admin/controllers/home_admin_controller.dart';

class HomeAdminScreen extends GetView<HomeAdminController> {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeAdminController());
    HomeAdminBinding().dependencies();
    controller.dashboard();
    controller.getUserData();

    String formatRupiah(int number) {
      String currency = 'Rp. ';
      String formattedNumber = number.toString();
      String result = '';

      while (formattedNumber.length > 3) {
        result = '.' +
            formattedNumber.substring(formattedNumber.length - 3) +
            result;
        formattedNumber =
            formattedNumber.substring(0, formattedNumber.length - 3);
      }
      result = formattedNumber + result;

      return currency + result;
    }

    String formatDate(String inputDate) {
      DateTime date = DateTime.parse(inputDate);
      final months = [
        '',
        'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
      ];
      String day = date.day.toString().padLeft(2, '0');
      String month = months[date.month];
      String year = date.year.toString();
      return '$day $month $year';
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  backgroundColor: Colors.blue[50],
                ),
              )
            : controller.dashboardModel.value == null
                ? Center(child: Text('Tidak ada data'))
                : SafeArea(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.h),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hai, ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'popmed',
                                      fontSize: 6.sp),
                                ),
                                TextSpan(
                                  text: controller.sharedUserModel.username,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'popsem',
                                      fontSize: 8.sp),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              'Grafik Pendapatan',
                              style: TextStyle(
                                  fontFamily: 'popreg',
                                  color: Colors.grey,
                                  fontSize: 5.sp),
                            ),
                            subtitle: Text(
                              '${formatDate(controller.dashboardModel.value.tanggal_awal)} s/d ${formatDate(controller.dashboardModel.value.tanggal_akhir)}',
                              style: TextStyle(
                                  fontFamily: 'popsem',
                                  color: Colors.black,
                                  fontSize: 6.sp),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              width: 1000.w,
                              height: 200.h,
                              child: Padding(
                                padding: EdgeInsets.only(top: 50.h),
                                child: line_chart(controller, formatRupiah),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }

  LineChart line_chart(
      HomeAdminController controller, String formatRupiah(int number)) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: titlesData(controller),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipMargin: 10,
            tooltipRoundedRadius: 10,
            tooltipHorizontalAlignment: FLHorizontalAlignment.center,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                final value = formatRupiah(touchedSpot.y.toInt());
                return LineTooltipItem(
                  value.toString(),
                  const TextStyle(fontFamily: 'popmed', color: Colors.white),
                );
              }).toList();
            },
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (var i = 0;
                  i < controller.dashboardModel.value.data_pendapatan.length;
                  i++)
                FlSpot(
                    i.toDouble(),
                    controller.dashboardModel.value.data_pendapatan[i]
                        .toDouble()),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData:
                BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }

  FlTitlesData titlesData(HomeAdminController controller) {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            reservedSize: 35,
            interval: 1,
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return Text(
                controller.dashboardModel.value.data_tanggal[value.toInt()]
                    .toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'popmed',
                  fontSize: 6.sp,
                ),
              );
            }),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }
}

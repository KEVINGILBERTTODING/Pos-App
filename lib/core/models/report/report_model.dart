import 'package:freezed_annotation/freezed_annotation.dart';
part 'report_model.g.dart';
part 'report_model.freezed.dart';

@freezed
class ReportModel with _$ReportModel {
  const factory ReportModel({
    dynamic DT_RowIndex,
    @Default('0') String tanggal,
    @Default('0') String penjualan,
    @Default('0') String pembelian,
    @Default('0') String pengeluaran,
    @Default('0') String pendapatan,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, dynamic> map) =>
      _$ReportModelFromJson(map);
}

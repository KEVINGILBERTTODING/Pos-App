import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class DashboardModel with _$DashboardModel {
  const factory DashboardModel(
      {@Default(0) int kategori,
      @Default(0) int produk,
      @Default(0) int supplier,
      @Default(0) int member,
      @Default('') String tanggal_awal,
      @Default('') String tanggal_akhir,
      dynamic data_tanggal,
      dynamic data_pendapatan}) = _DashboardModel;

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
}

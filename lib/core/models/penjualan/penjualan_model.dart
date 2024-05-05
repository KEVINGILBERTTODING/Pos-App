import 'package:freezed_annotation/freezed_annotation.dart';
part 'penjualan_model.freezed.dart';
part 'penjualan_model.g.dart';

@freezed
class PenjualanModel with _$PenjualanModel {
  const factory PenjualanModel({
    @Default(0) int id_penjualan,
    @Default(0) int id_member,
    @Default(0) int total_item,
    @Default(0) int total_harga,
    @Default(0) int diskon,
    @Default(0) int bayar,
    @Default(0) int diterima,
    @Default(0) int id_user,
    String? created_at,
    String? updated_at,
  }) = _PenjualanModel;

  factory PenjualanModel.fromJson(Map<String, dynamic> json) =>
      _$PenjualanModelFromJson(json);
}

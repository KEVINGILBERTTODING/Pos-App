import 'package:freezed_annotation/freezed_annotation.dart';

part 'penjualan_detail_model.freezed.dart';
part 'penjualan_detail_model.g.dart';

@freezed
class PenjualanDetailModel with _$PenjualanDetailModel {
  const factory PenjualanDetailModel({
    @Default(0) int id_penjualan_detail,
    @Default(0) int id_penjualan,
    @Default(0) int id_produk,
    @Default(0) int harga_jual,
    @Default(0) int jumlah,
    @Default(0) int diskon,
    @Default(0) int subtotal,
    @Default(0) int total_stock,
    String? created_at,
    String? updated_at,
    String? productName,
  }) = _PenjualanDetailModel;

  factory PenjualanDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PenjualanDetailModelFromJson(json);
}

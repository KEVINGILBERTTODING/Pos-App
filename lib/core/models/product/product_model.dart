import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default(0) int id_produk,
    @Default(0) int id_kategori,
    String? kode_produk,
    String? nama_produk,
    String? merk,
    @Default(0) int harga_beli,
    @Default(0) int diskon,
    @Default(0) int harga_jual,
    @Default(0) int stok,
    String? img,
    String? created_at,
    String? updated_at,
    String? nama_kategori,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

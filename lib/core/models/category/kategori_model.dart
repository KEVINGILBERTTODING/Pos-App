import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'kategori_model.freezed.dart';
part 'kategori_model.g.dart';

@freezed
class KategoriModel with _$KategoriModel {
  const factory KategoriModel(
      {@Default(0) int id_kategori, String? nama_kategori}) = _KategoriModel;

  factory KategoriModel.fromJson(Map<String, dynamic> json) =>
      _$KategoriModelFromJson(json);
}

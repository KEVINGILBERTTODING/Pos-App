import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_model.g.dart';
part 'app_model.freezed.dart';

@freezed
class AppModel with _$AppModel {
  const factory AppModel({
    @Default(0) int id_setting,
    @Default("") String nama_perusahaan,
    @Default("") String alamat,
    @Default("") String telepon,
    @Default(0) int tipe_nota,
    @Default(0) int diskon,
    @Default("") String path_logo,
    @Default("") String path_kartu_member,
    @Default(null) DateTime? created_at,
    @Default(null) DateTime? updated_at,
  }) = _AppModel;

  factory AppModel.fromJson(Map<String, dynamic> json) =>
      _$AppModelFromJson(json);
}

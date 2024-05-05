import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

@freezed
class MemberModel with _$MemberModel {
  const factory MemberModel({
    @Default(0) int id_member,
    String? kode_member,
    String? nama,
    String? alamat,
    String? telepon,
    DateTime? created_at,
  }) = _MemberModel;

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);
}

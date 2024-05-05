// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberModelImpl _$$MemberModelImplFromJson(Map<String, dynamic> json) =>
    _$MemberModelImpl(
      id_member: (json['id_member'] as num?)?.toInt() ?? 0,
      kode_member: json['kode_member'] as String?,
      nama: json['nama'] as String?,
      alamat: json['alamat'] as String?,
      telepon: json['telepon'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$MemberModelImplToJson(_$MemberModelImpl instance) =>
    <String, dynamic>{
      'id_member': instance.id_member,
      'kode_member': instance.kode_member,
      'nama': instance.nama,
      'alamat': instance.alamat,
      'telepon': instance.telepon,
      'created_at': instance.created_at?.toIso8601String(),
    };

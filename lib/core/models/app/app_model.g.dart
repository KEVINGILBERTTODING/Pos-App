// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppModelImpl _$$AppModelImplFromJson(Map<String, dynamic> json) =>
    _$AppModelImpl(
      id_setting: (json['id_setting'] as num?)?.toInt() ?? 0,
      nama_perusahaan: json['nama_perusahaan'] as String? ?? "",
      alamat: json['alamat'] as String? ?? "",
      telepon: json['telepon'] as String? ?? "",
      tipe_nota: (json['tipe_nota'] as num?)?.toInt() ?? 0,
      diskon: (json['diskon'] as num?)?.toInt() ?? 0,
      path_logo: json['path_logo'] as String? ?? "",
      path_kartu_member: json['path_kartu_member'] as String? ?? "",
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AppModelImplToJson(_$AppModelImpl instance) =>
    <String, dynamic>{
      'id_setting': instance.id_setting,
      'nama_perusahaan': instance.nama_perusahaan,
      'alamat': instance.alamat,
      'telepon': instance.telepon,
      'tipe_nota': instance.tipe_nota,
      'diskon': instance.diskon,
      'path_logo': instance.path_logo,
      'path_kartu_member': instance.path_kartu_member,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };

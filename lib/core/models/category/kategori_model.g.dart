// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kategori_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KategoriModelImpl _$$KategoriModelImplFromJson(Map<String, dynamic> json) =>
    _$KategoriModelImpl(
      id_kategori: (json['id_kategori'] as num?)?.toInt() ?? 0,
      nama_kategori: json['nama_kategori'] as String?,
    );

Map<String, dynamic> _$$KategoriModelImplToJson(_$KategoriModelImpl instance) =>
    <String, dynamic>{
      'id_kategori': instance.id_kategori,
      'nama_kategori': instance.nama_kategori,
    };

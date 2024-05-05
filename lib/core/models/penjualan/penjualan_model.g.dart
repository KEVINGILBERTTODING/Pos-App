// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penjualan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PenjualanModelImpl _$$PenjualanModelImplFromJson(Map<String, dynamic> json) =>
    _$PenjualanModelImpl(
      id_penjualan: (json['id_penjualan'] as num?)?.toInt() ?? 0,
      id_member: (json['id_member'] as num?)?.toInt() ?? 0,
      total_item: (json['total_item'] as num?)?.toInt() ?? 0,
      total_harga: (json['total_harga'] as num?)?.toInt() ?? 0,
      diskon: (json['diskon'] as num?)?.toInt() ?? 0,
      bayar: (json['bayar'] as num?)?.toInt() ?? 0,
      diterima: (json['diterima'] as num?)?.toInt() ?? 0,
      id_user: (json['id_user'] as num?)?.toInt() ?? 0,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$PenjualanModelImplToJson(
        _$PenjualanModelImpl instance) =>
    <String, dynamic>{
      'id_penjualan': instance.id_penjualan,
      'id_member': instance.id_member,
      'total_item': instance.total_item,
      'total_harga': instance.total_harga,
      'diskon': instance.diskon,
      'bayar': instance.bayar,
      'diterima': instance.diterima,
      'id_user': instance.id_user,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

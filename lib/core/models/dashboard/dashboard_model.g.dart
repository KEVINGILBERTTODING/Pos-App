// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardModelImpl _$$DashboardModelImplFromJson(Map<String, dynamic> json) =>
    _$DashboardModelImpl(
      kategori: (json['kategori'] as num?)?.toInt() ?? 0,
      produk: (json['produk'] as num?)?.toInt() ?? 0,
      supplier: (json['supplier'] as num?)?.toInt() ?? 0,
      member: (json['member'] as num?)?.toInt() ?? 0,
      tanggal_awal: json['tanggal_awal'] as String? ?? '',
      tanggal_akhir: json['tanggal_akhir'] as String? ?? '',
      data_tanggal: json['data_tanggal'],
      data_pendapatan: json['data_pendapatan'],
    );

Map<String, dynamic> _$$DashboardModelImplToJson(
        _$DashboardModelImpl instance) =>
    <String, dynamic>{
      'kategori': instance.kategori,
      'produk': instance.produk,
      'supplier': instance.supplier,
      'member': instance.member,
      'tanggal_awal': instance.tanggal_awal,
      'tanggal_akhir': instance.tanggal_akhir,
      'data_tanggal': instance.data_tanggal,
      'data_pendapatan': instance.data_pendapatan,
    };

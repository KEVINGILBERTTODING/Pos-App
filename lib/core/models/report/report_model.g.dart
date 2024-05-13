// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportModelImpl _$$ReportModelImplFromJson(Map<String, dynamic> json) =>
    _$ReportModelImpl(
      DT_RowIndex: json['DT_RowIndex'],
      tanggal: json['tanggal'] as String? ?? '0',
      penjualan: json['penjualan'] as String? ?? '0',
      pembelian: json['pembelian'] as String? ?? '0',
      pengeluaran: json['pengeluaran'] as String? ?? '0',
      pendapatan: json['pendapatan'] as String? ?? '0',
    );

Map<String, dynamic> _$$ReportModelImplToJson(_$ReportModelImpl instance) =>
    <String, dynamic>{
      'DT_RowIndex': instance.DT_RowIndex,
      'tanggal': instance.tanggal,
      'penjualan': instance.penjualan,
      'pembelian': instance.pembelian,
      'pengeluaran': instance.pengeluaran,
      'pendapatan': instance.pendapatan,
    };

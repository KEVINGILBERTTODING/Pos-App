// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penjualan_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PenjualanDetailModelImpl _$$PenjualanDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PenjualanDetailModelImpl(
      id_penjualan_detail: (json['id_penjualan_detail'] as num?)?.toInt() ?? 0,
      id_penjualan: (json['id_penjualan'] as num?)?.toInt() ?? 0,
      id_produk: (json['id_produk'] as num?)?.toInt() ?? 0,
      harga_jual: (json['harga_jual'] as num?)?.toInt() ?? 0,
      jumlah: (json['jumlah'] as num?)?.toInt() ?? 0,
      diskon: (json['diskon'] as num?)?.toInt() ?? 0,
      subtotal: (json['subtotal'] as num?)?.toInt() ?? 0,
      total_stock: (json['total_stock'] as num?)?.toInt() ?? 0,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      productName: json['productName'] as String?,
    );

Map<String, dynamic> _$$PenjualanDetailModelImplToJson(
        _$PenjualanDetailModelImpl instance) =>
    <String, dynamic>{
      'id_penjualan_detail': instance.id_penjualan_detail,
      'id_penjualan': instance.id_penjualan,
      'id_produk': instance.id_produk,
      'harga_jual': instance.harga_jual,
      'jumlah': instance.jumlah,
      'diskon': instance.diskon,
      'subtotal': instance.subtotal,
      'total_stock': instance.total_stock,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'productName': instance.productName,
    };

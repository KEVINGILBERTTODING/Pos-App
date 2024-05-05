// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id_produk: (json['id_produk'] as num?)?.toInt() ?? 0,
      id_kategori: (json['id_kategori'] as num?)?.toInt() ?? 0,
      kode_produk: json['kode_produk'] as String?,
      nama_produk: json['nama_produk'] as String?,
      merk: json['merk'] as String?,
      harga_beli: (json['harga_beli'] as num?)?.toInt() ?? 0,
      diskon: (json['diskon'] as num?)?.toInt() ?? 0,
      harga_jual: (json['harga_jual'] as num?)?.toInt() ?? 0,
      stok: (json['stok'] as num?)?.toInt() ?? 0,
      img: json['img'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      nama_kategori: json['nama_kategori'] as String?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id_produk': instance.id_produk,
      'id_kategori': instance.id_kategori,
      'kode_produk': instance.kode_produk,
      'nama_produk': instance.nama_produk,
      'merk': instance.merk,
      'harga_beli': instance.harga_beli,
      'diskon': instance.diskon,
      'harga_jual': instance.harga_jual,
      'stok': instance.stok,
      'img': instance.img,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'nama_kategori': instance.nama_kategori,
    };

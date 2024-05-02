// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientModelImpl _$$ClientModelImplFromJson(Map<String, dynamic> json) =>
    _$ClientModelImpl(
      user_id: (json['user_id'] as num?)?.toInt() ?? 0,
      role: (json['role'] as num?)?.toInt() ?? 0,
      foto: json['foto'] as String?,
      name: json['name'] as String? ?? "Guest",
    );

Map<String, dynamic> _$$ClientModelImplToJson(_$ClientModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'role': instance.role,
      'foto': instance.foto,
      'name': instance.name,
    };

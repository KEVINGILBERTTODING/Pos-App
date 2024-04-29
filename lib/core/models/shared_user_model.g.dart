// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SharedUserModelImpl _$$SharedUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SharedUserModelImpl(
      is_login: json['is_login'] as bool? ?? false,
      user_id: (json['user_id'] as num?)?.toInt() ?? 0,
      role: (json['role'] as num?)?.toInt() ?? 0,
      username: json['username'] as String? ?? "Guest",
    );

Map<String, dynamic> _$$SharedUserModelImplToJson(
        _$SharedUserModelImpl instance) =>
    <String, dynamic>{
      'is_login': instance.is_login,
      'user_id': instance.user_id,
      'role': instance.role,
      'username': instance.username,
    };

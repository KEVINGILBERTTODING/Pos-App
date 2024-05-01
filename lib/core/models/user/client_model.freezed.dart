// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientModel _$ClientModelFromJson(Map<String, dynamic> json) {
  return _ClientModel.fromJson(json);
}

/// @nodoc
mixin _$ClientModel {
  int get user_id => throw _privateConstructorUsedError;
  int get role => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientModelCopyWith<ClientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientModelCopyWith<$Res> {
  factory $ClientModelCopyWith(
          ClientModel value, $Res Function(ClientModel) then) =
      _$ClientModelCopyWithImpl<$Res, ClientModel>;
  @useResult
  $Res call({int user_id, int role, String name});
}

/// @nodoc
class _$ClientModelCopyWithImpl<$Res, $Val extends ClientModel>
    implements $ClientModelCopyWith<$Res> {
  _$ClientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? role = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientModelImplCopyWith<$Res>
    implements $ClientModelCopyWith<$Res> {
  factory _$$ClientModelImplCopyWith(
          _$ClientModelImpl value, $Res Function(_$ClientModelImpl) then) =
      __$$ClientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int user_id, int role, String name});
}

/// @nodoc
class __$$ClientModelImplCopyWithImpl<$Res>
    extends _$ClientModelCopyWithImpl<$Res, _$ClientModelImpl>
    implements _$$ClientModelImplCopyWith<$Res> {
  __$$ClientModelImplCopyWithImpl(
      _$ClientModelImpl _value, $Res Function(_$ClientModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = null,
    Object? role = null,
    Object? name = null,
  }) {
    return _then(_$ClientModelImpl(
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientModelImpl implements _ClientModel {
  const _$ClientModelImpl(
      {this.user_id = 0, this.role = 0, this.name = "Guest"});

  factory _$ClientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientModelImplFromJson(json);

  @override
  @JsonKey()
  final int user_id;
  @override
  @JsonKey()
  final int role;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'ClientModel(user_id: $user_id, role: $role, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientModelImpl &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user_id, role, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientModelImplCopyWith<_$ClientModelImpl> get copyWith =>
      __$$ClientModelImplCopyWithImpl<_$ClientModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientModelImplToJson(
      this,
    );
  }
}

abstract class _ClientModel implements ClientModel {
  const factory _ClientModel(
      {final int user_id,
      final int role,
      final String name}) = _$ClientModelImpl;

  factory _ClientModel.fromJson(Map<String, dynamic> json) =
      _$ClientModelImpl.fromJson;

  @override
  int get user_id;
  @override
  int get role;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$ClientModelImplCopyWith<_$ClientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

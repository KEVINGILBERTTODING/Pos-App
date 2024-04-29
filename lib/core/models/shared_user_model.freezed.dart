// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SharedUserModel _$SharedUserModelFromJson(Map<String, dynamic> json) {
  return _SharedUserModel.fromJson(json);
}

/// @nodoc
mixin _$SharedUserModel {
  bool get is_login => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  int get role => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SharedUserModelCopyWith<SharedUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedUserModelCopyWith<$Res> {
  factory $SharedUserModelCopyWith(
          SharedUserModel value, $Res Function(SharedUserModel) then) =
      _$SharedUserModelCopyWithImpl<$Res, SharedUserModel>;
  @useResult
  $Res call({bool is_login, int user_id, int role, String username});
}

/// @nodoc
class _$SharedUserModelCopyWithImpl<$Res, $Val extends SharedUserModel>
    implements $SharedUserModelCopyWith<$Res> {
  _$SharedUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? is_login = null,
    Object? user_id = null,
    Object? role = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      is_login: null == is_login
          ? _value.is_login
          : is_login // ignore: cast_nullable_to_non_nullable
              as bool,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SharedUserModelImplCopyWith<$Res>
    implements $SharedUserModelCopyWith<$Res> {
  factory _$$SharedUserModelImplCopyWith(_$SharedUserModelImpl value,
          $Res Function(_$SharedUserModelImpl) then) =
      __$$SharedUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool is_login, int user_id, int role, String username});
}

/// @nodoc
class __$$SharedUserModelImplCopyWithImpl<$Res>
    extends _$SharedUserModelCopyWithImpl<$Res, _$SharedUserModelImpl>
    implements _$$SharedUserModelImplCopyWith<$Res> {
  __$$SharedUserModelImplCopyWithImpl(
      _$SharedUserModelImpl _value, $Res Function(_$SharedUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? is_login = null,
    Object? user_id = null,
    Object? role = null,
    Object? username = null,
  }) {
    return _then(_$SharedUserModelImpl(
      is_login: null == is_login
          ? _value.is_login
          : is_login // ignore: cast_nullable_to_non_nullable
              as bool,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SharedUserModelImpl implements _SharedUserModel {
  const _$SharedUserModelImpl(
      {this.is_login = false,
      this.user_id = 0,
      this.role = 0,
      this.username = "Guest"});

  factory _$SharedUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharedUserModelImplFromJson(json);

  @override
  @JsonKey()
  final bool is_login;
  @override
  @JsonKey()
  final int user_id;
  @override
  @JsonKey()
  final int role;
  @override
  @JsonKey()
  final String username;

  @override
  String toString() {
    return 'SharedUserModel(is_login: $is_login, user_id: $user_id, role: $role, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedUserModelImpl &&
            (identical(other.is_login, is_login) ||
                other.is_login == is_login) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, is_login, user_id, role, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedUserModelImplCopyWith<_$SharedUserModelImpl> get copyWith =>
      __$$SharedUserModelImplCopyWithImpl<_$SharedUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SharedUserModelImplToJson(
      this,
    );
  }
}

abstract class _SharedUserModel implements SharedUserModel {
  const factory _SharedUserModel(
      {final bool is_login,
      final int user_id,
      final int role,
      final String username}) = _$SharedUserModelImpl;

  factory _SharedUserModel.fromJson(Map<String, dynamic> json) =
      _$SharedUserModelImpl.fromJson;

  @override
  bool get is_login;
  @override
  int get user_id;
  @override
  int get role;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$SharedUserModelImplCopyWith<_$SharedUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

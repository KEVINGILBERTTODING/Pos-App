// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseApiModel _$ResponseApiModelFromJson(Map<String, dynamic> json) {
  return _ResponseApiModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseApiModel {
  String? get responsestate => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseApiModelCopyWith<ResponseApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseApiModelCopyWith<$Res> {
  factory $ResponseApiModelCopyWith(
          ResponseApiModel value, $Res Function(ResponseApiModel) then) =
      _$ResponseApiModelCopyWithImpl<$Res, ResponseApiModel>;
  @useResult
  $Res call({String? responsestate, String? message, dynamic data});
}

/// @nodoc
class _$ResponseApiModelCopyWithImpl<$Res, $Val extends ResponseApiModel>
    implements $ResponseApiModelCopyWith<$Res> {
  _$ResponseApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responsestate = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      responsestate: freezed == responsestate
          ? _value.responsestate
          : responsestate // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseApiModelImplCopyWith<$Res>
    implements $ResponseApiModelCopyWith<$Res> {
  factory _$$ResponseApiModelImplCopyWith(_$ResponseApiModelImpl value,
          $Res Function(_$ResponseApiModelImpl) then) =
      __$$ResponseApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? responsestate, String? message, dynamic data});
}

/// @nodoc
class __$$ResponseApiModelImplCopyWithImpl<$Res>
    extends _$ResponseApiModelCopyWithImpl<$Res, _$ResponseApiModelImpl>
    implements _$$ResponseApiModelImplCopyWith<$Res> {
  __$$ResponseApiModelImplCopyWithImpl(_$ResponseApiModelImpl _value,
      $Res Function(_$ResponseApiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responsestate = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResponseApiModelImpl(
      responsestate: freezed == responsestate
          ? _value.responsestate
          : responsestate // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseApiModelImpl implements _ResponseApiModel {
  const _$ResponseApiModelImpl({this.responsestate, this.message, this.data});

  factory _$ResponseApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseApiModelImplFromJson(json);

  @override
  final String? responsestate;
  @override
  final String? message;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'ResponseApiModel(responsestate: $responsestate, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseApiModelImpl &&
            (identical(other.responsestate, responsestate) ||
                other.responsestate == responsestate) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, responsestate, message,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseApiModelImplCopyWith<_$ResponseApiModelImpl> get copyWith =>
      __$$ResponseApiModelImplCopyWithImpl<_$ResponseApiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseApiModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseApiModel implements ResponseApiModel {
  const factory _ResponseApiModel(
      {final String? responsestate,
      final String? message,
      final dynamic data}) = _$ResponseApiModelImpl;

  factory _ResponseApiModel.fromJson(Map<String, dynamic> json) =
      _$ResponseApiModelImpl.fromJson;

  @override
  String? get responsestate;
  @override
  String? get message;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$ResponseApiModelImplCopyWith<_$ResponseApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

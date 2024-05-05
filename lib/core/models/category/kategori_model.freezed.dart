// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kategori_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KategoriModel _$KategoriModelFromJson(Map<String, dynamic> json) {
  return _KategoriModel.fromJson(json);
}

/// @nodoc
mixin _$KategoriModel {
  int get id_kategori => throw _privateConstructorUsedError;
  String? get nama_kategori => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KategoriModelCopyWith<KategoriModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KategoriModelCopyWith<$Res> {
  factory $KategoriModelCopyWith(
          KategoriModel value, $Res Function(KategoriModel) then) =
      _$KategoriModelCopyWithImpl<$Res, KategoriModel>;
  @useResult
  $Res call({int id_kategori, String? nama_kategori});
}

/// @nodoc
class _$KategoriModelCopyWithImpl<$Res, $Val extends KategoriModel>
    implements $KategoriModelCopyWith<$Res> {
  _$KategoriModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_kategori = null,
    Object? nama_kategori = freezed,
  }) {
    return _then(_value.copyWith(
      id_kategori: null == id_kategori
          ? _value.id_kategori
          : id_kategori // ignore: cast_nullable_to_non_nullable
              as int,
      nama_kategori: freezed == nama_kategori
          ? _value.nama_kategori
          : nama_kategori // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KategoriModelImplCopyWith<$Res>
    implements $KategoriModelCopyWith<$Res> {
  factory _$$KategoriModelImplCopyWith(
          _$KategoriModelImpl value, $Res Function(_$KategoriModelImpl) then) =
      __$$KategoriModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id_kategori, String? nama_kategori});
}

/// @nodoc
class __$$KategoriModelImplCopyWithImpl<$Res>
    extends _$KategoriModelCopyWithImpl<$Res, _$KategoriModelImpl>
    implements _$$KategoriModelImplCopyWith<$Res> {
  __$$KategoriModelImplCopyWithImpl(
      _$KategoriModelImpl _value, $Res Function(_$KategoriModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_kategori = null,
    Object? nama_kategori = freezed,
  }) {
    return _then(_$KategoriModelImpl(
      id_kategori: null == id_kategori
          ? _value.id_kategori
          : id_kategori // ignore: cast_nullable_to_non_nullable
              as int,
      nama_kategori: freezed == nama_kategori
          ? _value.nama_kategori
          : nama_kategori // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KategoriModelImpl implements _KategoriModel {
  const _$KategoriModelImpl({this.id_kategori = 0, this.nama_kategori});

  factory _$KategoriModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KategoriModelImplFromJson(json);

  @override
  @JsonKey()
  final int id_kategori;
  @override
  final String? nama_kategori;

  @override
  String toString() {
    return 'KategoriModel(id_kategori: $id_kategori, nama_kategori: $nama_kategori)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KategoriModelImpl &&
            (identical(other.id_kategori, id_kategori) ||
                other.id_kategori == id_kategori) &&
            (identical(other.nama_kategori, nama_kategori) ||
                other.nama_kategori == nama_kategori));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id_kategori, nama_kategori);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KategoriModelImplCopyWith<_$KategoriModelImpl> get copyWith =>
      __$$KategoriModelImplCopyWithImpl<_$KategoriModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KategoriModelImplToJson(
      this,
    );
  }
}

abstract class _KategoriModel implements KategoriModel {
  const factory _KategoriModel(
      {final int id_kategori,
      final String? nama_kategori}) = _$KategoriModelImpl;

  factory _KategoriModel.fromJson(Map<String, dynamic> json) =
      _$KategoriModelImpl.fromJson;

  @override
  int get id_kategori;
  @override
  String? get nama_kategori;
  @override
  @JsonKey(ignore: true)
  _$$KategoriModelImplCopyWith<_$KategoriModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

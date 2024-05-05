// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) {
  return _MemberModel.fromJson(json);
}

/// @nodoc
mixin _$MemberModel {
  int get id_member => throw _privateConstructorUsedError;
  String? get kode_member => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;
  String? get alamat => throw _privateConstructorUsedError;
  String? get telepon => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberModelCopyWith<MemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberModelCopyWith<$Res> {
  factory $MemberModelCopyWith(
          MemberModel value, $Res Function(MemberModel) then) =
      _$MemberModelCopyWithImpl<$Res, MemberModel>;
  @useResult
  $Res call(
      {int id_member,
      String? kode_member,
      String? nama,
      String? alamat,
      String? telepon,
      DateTime? created_at});
}

/// @nodoc
class _$MemberModelCopyWithImpl<$Res, $Val extends MemberModel>
    implements $MemberModelCopyWith<$Res> {
  _$MemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_member = null,
    Object? kode_member = freezed,
    Object? nama = freezed,
    Object? alamat = freezed,
    Object? telepon = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_value.copyWith(
      id_member: null == id_member
          ? _value.id_member
          : id_member // ignore: cast_nullable_to_non_nullable
              as int,
      kode_member: freezed == kode_member
          ? _value.kode_member
          : kode_member // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      alamat: freezed == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String?,
      telepon: freezed == telepon
          ? _value.telepon
          : telepon // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberModelImplCopyWith<$Res>
    implements $MemberModelCopyWith<$Res> {
  factory _$$MemberModelImplCopyWith(
          _$MemberModelImpl value, $Res Function(_$MemberModelImpl) then) =
      __$$MemberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id_member,
      String? kode_member,
      String? nama,
      String? alamat,
      String? telepon,
      DateTime? created_at});
}

/// @nodoc
class __$$MemberModelImplCopyWithImpl<$Res>
    extends _$MemberModelCopyWithImpl<$Res, _$MemberModelImpl>
    implements _$$MemberModelImplCopyWith<$Res> {
  __$$MemberModelImplCopyWithImpl(
      _$MemberModelImpl _value, $Res Function(_$MemberModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_member = null,
    Object? kode_member = freezed,
    Object? nama = freezed,
    Object? alamat = freezed,
    Object? telepon = freezed,
    Object? created_at = freezed,
  }) {
    return _then(_$MemberModelImpl(
      id_member: null == id_member
          ? _value.id_member
          : id_member // ignore: cast_nullable_to_non_nullable
              as int,
      kode_member: freezed == kode_member
          ? _value.kode_member
          : kode_member // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      alamat: freezed == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String?,
      telepon: freezed == telepon
          ? _value.telepon
          : telepon // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberModelImpl implements _MemberModel {
  const _$MemberModelImpl(
      {this.id_member = 0,
      this.kode_member,
      this.nama,
      this.alamat,
      this.telepon,
      this.created_at});

  factory _$MemberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberModelImplFromJson(json);

  @override
  @JsonKey()
  final int id_member;
  @override
  final String? kode_member;
  @override
  final String? nama;
  @override
  final String? alamat;
  @override
  final String? telepon;
  @override
  final DateTime? created_at;

  @override
  String toString() {
    return 'MemberModel(id_member: $id_member, kode_member: $kode_member, nama: $nama, alamat: $alamat, telepon: $telepon, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberModelImpl &&
            (identical(other.id_member, id_member) ||
                other.id_member == id_member) &&
            (identical(other.kode_member, kode_member) ||
                other.kode_member == kode_member) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.telepon, telepon) || other.telepon == telepon) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id_member, kode_member, nama, alamat, telepon, created_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberModelImplCopyWith<_$MemberModelImpl> get copyWith =>
      __$$MemberModelImplCopyWithImpl<_$MemberModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberModelImplToJson(
      this,
    );
  }
}

abstract class _MemberModel implements MemberModel {
  const factory _MemberModel(
      {final int id_member,
      final String? kode_member,
      final String? nama,
      final String? alamat,
      final String? telepon,
      final DateTime? created_at}) = _$MemberModelImpl;

  factory _MemberModel.fromJson(Map<String, dynamic> json) =
      _$MemberModelImpl.fromJson;

  @override
  int get id_member;
  @override
  String? get kode_member;
  @override
  String? get nama;
  @override
  String? get alamat;
  @override
  String? get telepon;
  @override
  DateTime? get created_at;
  @override
  @JsonKey(ignore: true)
  _$$MemberModelImplCopyWith<_$MemberModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

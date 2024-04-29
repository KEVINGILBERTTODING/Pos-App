import 'package:freezed_annotation/freezed_annotation.dart';

part 'shared_user_model.freezed.dart';
part 'shared_user_model.g.dart';

@freezed
class SharedUserModel with _$SharedUserModel {
  const factory SharedUserModel(
      {@Default(false) bool is_login,
      @Default(0) int user_id,
      @Default(0) int role,
      @Default("Guest") String username}) = _SharedUserModel;

  factory SharedUserModel.fromJson(Map<String, dynamic> json) =>
      _$SharedUserModelFromJson(json);
}

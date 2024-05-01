import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.freezed.dart';
part 'client_model.g.dart';

@freezed
class ClientModel with _$ClientModel {
  const factory ClientModel(
      {@Default(0) int user_id,
      @Default(0) int role,
      @Default("Guest") String name}) = _ClientModel;

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);
}

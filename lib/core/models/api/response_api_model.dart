import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_api_model.freezed.dart';
part 'response_api_model.g.dart';

@freezed
class ResponseApiModel with _$ResponseApiModel {
  const factory ResponseApiModel(
      {String? responsestate,
      String? message,
      dynamic data}) = _ResponseApiModel;

  factory ResponseApiModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseApiModelFromJson(json);
}

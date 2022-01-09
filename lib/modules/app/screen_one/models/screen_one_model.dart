import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'screen_one_model.freezed.dart';
part 'screen_one_model.g.dart';

@freezed
class ScreenOneModelResponse with _$ScreenOneModelResponse {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory ScreenOneModelResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'user') SecondModule? secondModel,
  }) = _ScreenOneModelResponse;

  factory ScreenOneModelResponse.fromJson(Map<String, dynamic> json) => _$ScreenOneModelResponseFromJson(json);
}

@freezed
class SecondModule with _$SecondModule {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory SecondModule({
    @JsonKey(name: 's') String? s,
  }) = _SecondModule;

  factory SecondModule.fromJson(Map<String, dynamic> json) => _$SecondModuleFromJson(json);
}

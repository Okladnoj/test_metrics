import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'screen_two_model.freezed.dart';
part 'screen_two_model.g.dart';

@freezed
class ScreenTwoModelResponse with _$ScreenTwoModelResponse {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory ScreenTwoModelResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'user') SecondModule? secondModel,
  }) = _ScreenTwoModelResponse;

  factory ScreenTwoModelResponse.fromJson(Map<String, dynamic> json) => _$ScreenTwoModelResponseFromJson(json);
}

@freezed
class SecondModule with _$SecondModule {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory SecondModule({
    @JsonKey(name: 's') String? s,
  }) = _SecondModule;

  factory SecondModule.fromJson(Map<String, dynamic> json) => _$SecondModuleFromJson(json);
}

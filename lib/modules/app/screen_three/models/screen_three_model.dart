import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'screen_three_model.freezed.dart';
part 'screen_three_model.g.dart';

@freezed
class ScreenThreeModelResponse with _$ScreenThreeModelResponse {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory ScreenThreeModelResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'user') SecondModule? secondModel,
  }) = _ScreenThreeModelResponse;

  factory ScreenThreeModelResponse.fromJson(Map<String, dynamic> json) => _$ScreenThreeModelResponseFromJson(json);
}

@freezed
class SecondModule with _$SecondModule {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory SecondModule({
    @JsonKey(name: 's') String? s,
  }) = _SecondModule;

  factory SecondModule.fromJson(Map<String, dynamic> json) => _$SecondModuleFromJson(json);
}

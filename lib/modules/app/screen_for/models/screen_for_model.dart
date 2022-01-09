import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'screen_for_model.freezed.dart';
part 'screen_for_model.g.dart';

@freezed
class ScreenForModelResponse with _$ScreenForModelResponse {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory ScreenForModelResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'user') SecondModule? secondModel,
  }) = _ScreenForModelResponse;

  factory ScreenForModelResponse.fromJson(Map<String, dynamic> json) => _$ScreenForModelResponseFromJson(json);
}

@freezed
class SecondModule with _$SecondModule {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory SecondModule({
    @JsonKey(name: 's') String? s,
  }) = _SecondModule;

  factory SecondModule.fromJson(Map<String, dynamic> json) => _$SecondModuleFromJson(json);
}

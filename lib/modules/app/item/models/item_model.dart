import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
class ItemModelResponse with _$ItemModelResponse {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory ItemModelResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'user') SecondModule? secondModel,
  }) = _ItemModelResponse;

  factory ItemModelResponse.fromJson(Map<String, dynamic> json) => _$ItemModelResponseFromJson(json);
  factory ItemModelResponse.empty() => const ItemModelResponse();
}

@freezed
class SecondModule with _$SecondModule {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory SecondModule({
    @JsonKey(name: 's') String? s,
  }) = _SecondModule;

  factory SecondModule.fromJson(Map<String, dynamic> json) => _$SecondModuleFromJson(json);
}

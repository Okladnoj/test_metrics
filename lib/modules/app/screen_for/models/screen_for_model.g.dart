// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_for_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreenForModelResponse _$$_ScreenForModelResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ScreenForModelResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      secondModel: json['user'] == null
          ? null
          : SecondModule.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScreenForModelResponseToJson(
        _$_ScreenForModelResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'user': instance.secondModel?.toJson(),
    };

_$_SecondModule _$$_SecondModuleFromJson(Map<String, dynamic> json) =>
    _$_SecondModule(
      s: json['s'] as String?,
    );

Map<String, dynamic> _$$_SecondModuleToJson(_$_SecondModule instance) =>
    <String, dynamic>{
      's': instance.s,
    };

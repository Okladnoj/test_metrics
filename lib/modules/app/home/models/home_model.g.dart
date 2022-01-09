// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeModelResponse _$$_HomeModelResponseFromJson(Map<String, dynamic> json) =>
    _$_HomeModelResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      secondModel: json['user'] == null
          ? null
          : SecondModule.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HomeModelResponseToJson(
        _$_HomeModelResponse instance) =>
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

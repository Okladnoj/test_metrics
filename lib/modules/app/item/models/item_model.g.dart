// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemModelResponse _$$_ItemModelResponseFromJson(Map<String, dynamic> json) =>
    _$_ItemModelResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      secondModel: json['user'] == null
          ? null
          : SecondModule.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemModelResponseToJson(
        _$_ItemModelResponse instance) =>
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

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screen_one_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreenOneModelResponse _$ScreenOneModelResponseFromJson(
    Map<String, dynamic> json) {
  return _ScreenOneModelResponse.fromJson(json);
}

/// @nodoc
class _$ScreenOneModelResponseTearOff {
  const _$ScreenOneModelResponseTearOff();

  _ScreenOneModelResponse call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel}) {
    return _ScreenOneModelResponse(
      code: code,
      message: message,
      secondModel: secondModel,
    );
  }

  ScreenOneModelResponse fromJson(Map<String, Object?> json) {
    return ScreenOneModelResponse.fromJson(json);
  }
}

/// @nodoc
const $ScreenOneModelResponse = _$ScreenOneModelResponseTearOff();

/// @nodoc
mixin _$ScreenOneModelResponse {
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  SecondModule? get secondModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreenOneModelResponseCopyWith<ScreenOneModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenOneModelResponseCopyWith<$Res> {
  factory $ScreenOneModelResponseCopyWith(ScreenOneModelResponse value,
          $Res Function(ScreenOneModelResponse) then) =
      _$ScreenOneModelResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel});

  $SecondModuleCopyWith<$Res>? get secondModel;
}

/// @nodoc
class _$ScreenOneModelResponseCopyWithImpl<$Res>
    implements $ScreenOneModelResponseCopyWith<$Res> {
  _$ScreenOneModelResponseCopyWithImpl(this._value, this._then);

  final ScreenOneModelResponse _value;
  // ignore: unused_field
  final $Res Function(ScreenOneModelResponse) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? secondModel = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      secondModel: secondModel == freezed
          ? _value.secondModel
          : secondModel // ignore: cast_nullable_to_non_nullable
              as SecondModule?,
    ));
  }

  @override
  $SecondModuleCopyWith<$Res>? get secondModel {
    if (_value.secondModel == null) {
      return null;
    }

    return $SecondModuleCopyWith<$Res>(_value.secondModel!, (value) {
      return _then(_value.copyWith(secondModel: value));
    });
  }
}

/// @nodoc
abstract class _$ScreenOneModelResponseCopyWith<$Res>
    implements $ScreenOneModelResponseCopyWith<$Res> {
  factory _$ScreenOneModelResponseCopyWith(_ScreenOneModelResponse value,
          $Res Function(_ScreenOneModelResponse) then) =
      __$ScreenOneModelResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel});

  @override
  $SecondModuleCopyWith<$Res>? get secondModel;
}

/// @nodoc
class __$ScreenOneModelResponseCopyWithImpl<$Res>
    extends _$ScreenOneModelResponseCopyWithImpl<$Res>
    implements _$ScreenOneModelResponseCopyWith<$Res> {
  __$ScreenOneModelResponseCopyWithImpl(_ScreenOneModelResponse _value,
      $Res Function(_ScreenOneModelResponse) _then)
      : super(_value, (v) => _then(v as _ScreenOneModelResponse));

  @override
  _ScreenOneModelResponse get _value => super._value as _ScreenOneModelResponse;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? secondModel = freezed,
  }) {
    return _then(_ScreenOneModelResponse(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      secondModel: secondModel == freezed
          ? _value.secondModel
          : secondModel // ignore: cast_nullable_to_non_nullable
              as SecondModule?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class _$_ScreenOneModelResponse implements _ScreenOneModelResponse {
  const _$_ScreenOneModelResponse(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'user') this.secondModel});

  factory _$_ScreenOneModelResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ScreenOneModelResponseFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'message')
  final String? message;
  @override
  @JsonKey(name: 'user')
  final SecondModule? secondModel;

  @override
  String toString() {
    return 'ScreenOneModelResponse(code: $code, message: $message, secondModel: $secondModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScreenOneModelResponse &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.secondModel, secondModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(secondModel));

  @JsonKey(ignore: true)
  @override
  _$ScreenOneModelResponseCopyWith<_ScreenOneModelResponse> get copyWith =>
      __$ScreenOneModelResponseCopyWithImpl<_ScreenOneModelResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreenOneModelResponseToJson(this);
  }
}

abstract class _ScreenOneModelResponse implements ScreenOneModelResponse {
  const factory _ScreenOneModelResponse(
          {@JsonKey(name: 'code') int? code,
          @JsonKey(name: 'message') String? message,
          @JsonKey(name: 'user') SecondModule? secondModel}) =
      _$_ScreenOneModelResponse;

  factory _ScreenOneModelResponse.fromJson(Map<String, dynamic> json) =
      _$_ScreenOneModelResponse.fromJson;

  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'message')
  String? get message;
  @override
  @JsonKey(name: 'user')
  SecondModule? get secondModel;
  @override
  @JsonKey(ignore: true)
  _$ScreenOneModelResponseCopyWith<_ScreenOneModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

SecondModule _$SecondModuleFromJson(Map<String, dynamic> json) {
  return _SecondModule.fromJson(json);
}

/// @nodoc
class _$SecondModuleTearOff {
  const _$SecondModuleTearOff();

  _SecondModule call({@JsonKey(name: 's') String? s}) {
    return _SecondModule(
      s: s,
    );
  }

  SecondModule fromJson(Map<String, Object?> json) {
    return SecondModule.fromJson(json);
  }
}

/// @nodoc
const $SecondModule = _$SecondModuleTearOff();

/// @nodoc
mixin _$SecondModule {
  @JsonKey(name: 's')
  String? get s => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecondModuleCopyWith<SecondModule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecondModuleCopyWith<$Res> {
  factory $SecondModuleCopyWith(
          SecondModule value, $Res Function(SecondModule) then) =
      _$SecondModuleCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 's') String? s});
}

/// @nodoc
class _$SecondModuleCopyWithImpl<$Res> implements $SecondModuleCopyWith<$Res> {
  _$SecondModuleCopyWithImpl(this._value, this._then);

  final SecondModule _value;
  // ignore: unused_field
  final $Res Function(SecondModule) _then;

  @override
  $Res call({
    Object? s = freezed,
  }) {
    return _then(_value.copyWith(
      s: s == freezed
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SecondModuleCopyWith<$Res>
    implements $SecondModuleCopyWith<$Res> {
  factory _$SecondModuleCopyWith(
          _SecondModule value, $Res Function(_SecondModule) then) =
      __$SecondModuleCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 's') String? s});
}

/// @nodoc
class __$SecondModuleCopyWithImpl<$Res> extends _$SecondModuleCopyWithImpl<$Res>
    implements _$SecondModuleCopyWith<$Res> {
  __$SecondModuleCopyWithImpl(
      _SecondModule _value, $Res Function(_SecondModule) _then)
      : super(_value, (v) => _then(v as _SecondModule));

  @override
  _SecondModule get _value => super._value as _SecondModule;

  @override
  $Res call({
    Object? s = freezed,
  }) {
    return _then(_SecondModule(
      s: s == freezed
          ? _value.s
          : s // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class _$_SecondModule implements _SecondModule {
  const _$_SecondModule({@JsonKey(name: 's') this.s});

  factory _$_SecondModule.fromJson(Map<String, dynamic> json) =>
      _$$_SecondModuleFromJson(json);

  @override
  @JsonKey(name: 's')
  final String? s;

  @override
  String toString() {
    return 'SecondModule(s: $s)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SecondModule &&
            const DeepCollectionEquality().equals(other.s, s));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(s));

  @JsonKey(ignore: true)
  @override
  _$SecondModuleCopyWith<_SecondModule> get copyWith =>
      __$SecondModuleCopyWithImpl<_SecondModule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SecondModuleToJson(this);
  }
}

abstract class _SecondModule implements SecondModule {
  const factory _SecondModule({@JsonKey(name: 's') String? s}) =
      _$_SecondModule;

  factory _SecondModule.fromJson(Map<String, dynamic> json) =
      _$_SecondModule.fromJson;

  @override
  @JsonKey(name: 's')
  String? get s;
  @override
  @JsonKey(ignore: true)
  _$SecondModuleCopyWith<_SecondModule> get copyWith =>
      throw _privateConstructorUsedError;
}

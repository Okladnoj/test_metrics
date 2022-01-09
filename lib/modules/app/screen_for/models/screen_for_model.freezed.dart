// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'screen_for_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ScreenForModelResponse _$ScreenForModelResponseFromJson(
    Map<String, dynamic> json) {
  return _ScreenForModelResponse.fromJson(json);
}

/// @nodoc
class _$ScreenForModelResponseTearOff {
  const _$ScreenForModelResponseTearOff();

  _ScreenForModelResponse call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel}) {
    return _ScreenForModelResponse(
      code: code,
      message: message,
      secondModel: secondModel,
    );
  }

  ScreenForModelResponse fromJson(Map<String, Object?> json) {
    return ScreenForModelResponse.fromJson(json);
  }
}

/// @nodoc
const $ScreenForModelResponse = _$ScreenForModelResponseTearOff();

/// @nodoc
mixin _$ScreenForModelResponse {
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  SecondModule? get secondModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreenForModelResponseCopyWith<ScreenForModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreenForModelResponseCopyWith<$Res> {
  factory $ScreenForModelResponseCopyWith(ScreenForModelResponse value,
          $Res Function(ScreenForModelResponse) then) =
      _$ScreenForModelResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel});

  $SecondModuleCopyWith<$Res>? get secondModel;
}

/// @nodoc
class _$ScreenForModelResponseCopyWithImpl<$Res>
    implements $ScreenForModelResponseCopyWith<$Res> {
  _$ScreenForModelResponseCopyWithImpl(this._value, this._then);

  final ScreenForModelResponse _value;
  // ignore: unused_field
  final $Res Function(ScreenForModelResponse) _then;

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
abstract class _$ScreenForModelResponseCopyWith<$Res>
    implements $ScreenForModelResponseCopyWith<$Res> {
  factory _$ScreenForModelResponseCopyWith(_ScreenForModelResponse value,
          $Res Function(_ScreenForModelResponse) then) =
      __$ScreenForModelResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel});

  @override
  $SecondModuleCopyWith<$Res>? get secondModel;
}

/// @nodoc
class __$ScreenForModelResponseCopyWithImpl<$Res>
    extends _$ScreenForModelResponseCopyWithImpl<$Res>
    implements _$ScreenForModelResponseCopyWith<$Res> {
  __$ScreenForModelResponseCopyWithImpl(_ScreenForModelResponse _value,
      $Res Function(_ScreenForModelResponse) _then)
      : super(_value, (v) => _then(v as _ScreenForModelResponse));

  @override
  _ScreenForModelResponse get _value => super._value as _ScreenForModelResponse;

  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? secondModel = freezed,
  }) {
    return _then(_ScreenForModelResponse(
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
class _$_ScreenForModelResponse implements _ScreenForModelResponse {
  const _$_ScreenForModelResponse(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'user') this.secondModel});

  factory _$_ScreenForModelResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ScreenForModelResponseFromJson(json);

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
    return 'ScreenForModelResponse(code: $code, message: $message, secondModel: $secondModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScreenForModelResponse &&
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
  _$ScreenForModelResponseCopyWith<_ScreenForModelResponse> get copyWith =>
      __$ScreenForModelResponseCopyWithImpl<_ScreenForModelResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScreenForModelResponseToJson(this);
  }
}

abstract class _ScreenForModelResponse implements ScreenForModelResponse {
  const factory _ScreenForModelResponse(
          {@JsonKey(name: 'code') int? code,
          @JsonKey(name: 'message') String? message,
          @JsonKey(name: 'user') SecondModule? secondModel}) =
      _$_ScreenForModelResponse;

  factory _ScreenForModelResponse.fromJson(Map<String, dynamic> json) =
      _$_ScreenForModelResponse.fromJson;

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
  _$ScreenForModelResponseCopyWith<_ScreenForModelResponse> get copyWith =>
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

import 'dart:developer';
import 'dart:io';

///dart run wg.dart && flutter pub run build_runner build --delete-conflicting-outputs
///
const nameModule = 'ScreenFor';
const namePackage = 'test_metrics';
const directory = 'lib/modules/app';

Future<void> main() async {
  // ignore: unnecessary_raw_strings
  final RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
  fName = nameModule.replaceAllMapped(exp, (Match m) => '_' + (m.group(0) ?? '')).toLowerCase();
  iFileName = 'i_$fName.dart';
  pFileName = 'p_$fName.dart';
  sFileName = 's_$fName.dart';
  tFileName = 'w_${fName}_title.dart';
  mFileName = '${fName}_model.dart';
  fgFileName = '${fName}_model.freezed.dart';
  jgFileName = '${fName}_model.g.dart';
  muFileName = '${fName}_model_ui.dart';
  dFileName = '${fName}_api.dart';
  final iPas = [directory, fName, iFileName].join('/');
  final pPas = [directory, fName, pFileName].join('/');
  final sPas = [directory, fName, sFileName].join('/');
  final tPas = [directory, fName, 'widgets', tFileName].join('/');
  final mPas = [directory, fName, 'models', mFileName].join('/');
  final fgPas = [directory, fName, 'models', fgFileName].join('/');
  final jgPas = [directory, fName, 'models', jgFileName].join('/');
  final muPas = [directory, fName, 'models', muFileName].join('/');
  final dPas = [directory, fName, 'domain', dFileName].join('/');

  File iFile = File(iPas);
  File pFile = File(pPas);
  File sFile = File(sPas);
  File tFile = File(tPas);
  File mFile = File(mPas);
  File fgFile = File(fgPas);
  File jgFile = File(jgPas);
  File muFile = File(muPas);
  File dFile = File(dPas);

  iFile = await iFile.create(recursive: true);
  pFile = await pFile.create(recursive: true);
  sFile = await sFile.create(recursive: true);
  tFile = await tFile.create(recursive: true);
  mFile = await mFile.create(recursive: true);
  // fgFile = await fgFile.create(recursive: true);
  // jgFile = await jgFile.create(recursive: true);
  muFile = await muFile.create(recursive: true);
  dFile = await dFile.create(recursive: true);

  await iFile.writeAsString(iContent);
  await pFile.writeAsString(pContent);
  await sFile.writeAsString(sContent);
  await tFile.writeAsString(tContent);
  await mFile.writeAsString(mContent);
  // await fgFile.writeAsString(fgContent);
  // await jgFile.writeAsString(jgContent);
  await muFile.writeAsString(muContent);
  await dFile.writeAsString(dContent);
  final printV = [
    iFile,
    pFile,
    sFile,
    mFile,
    fgFile,
    jgFile,
    muFile,
    dFile,
  ].map((e) => e.path).join(' - complete =)\n');
  log(printV, level: 2);
}

String iFileName = '';
String pFileName = '';
String sFileName = '';
String tFileName = '';
String mFileName = '';
String fgFileName = '';
String jgFileName = '';
String muFileName = '';
String dFileName = '';
String fName = '';

String get iContent => '''
import 'package:$namePackage/services/settings.dart';

import 'domain/$dFileName';
import 'models/$mFileName';
import 'models/$muFileName';
import 'p_$fName.dart';
import 's_$fName.dart';

class ${nameModule}Interactor with BaseInteractor<${nameModule}ModelUI> {
  late final ${nameModule}PState _state;
  late final ${nameModule}Api _api = ${nameModule}Api();
  ${nameModule}ModelResponse _model = const ${nameModule}ModelResponse();

  ${nameModule}Interactor(this._state) {
    _init();
  }

  Future<void> _init() async {
    sinkLoading.add(true);
    await _loadData();
    _updateUI();
    sinkLoading.add(false);
  }

  Future<void> _loadData() async {
    final result = await _api.get$nameModule();
    if (result != null) {
      _model = result;
    }
  }

  Future<void> onSomeMethod() async {
    await _deps?.onSomeMethod();
  }

  void _updateUI() {
    sink.add(_mapToUI());
  }

  ${nameModule}ModelUI _mapToUI() => ${nameModule}ModelUI(
        SecondModuleUI(_model.secondModel?.s ?? ''),
        _model.secondModel,
      );

  ${nameModule}Listener? get _deps => _state.context.findAncestorStateOfType<${nameModule}Listener>();

  @override
  Future<void> dispose() {
    return super.dispose();
  }
}
''';
String get pContent => '''
import 'package:$namePackage/services/settings.dart';

import 'i_$fName.dart';
import 'models/$muFileName';
import 'widgets/w_${fName}_title.dart';

class ${nameModule}P extends StatefulWidget {
  static const id = '${nameModule}P';
  const ${nameModule}P({Key? key}) : super(key: key);

  @override
  ${nameModule}PState createState() => ${nameModule}PState();
}

class ${nameModule}PState extends State<${nameModule}P> with ErrorHandlerState {
  ${nameModule}ModelUI? _modelUI;
  late final ${nameModule}Interactor _interactor;

  @override
  void initState() {
    _interactor = ${nameModule}Interactor(this);
    super.initState();
  }

  @override
  void dispose() {
    _interactor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<${nameModule}ModelUI>(
      stream: _interactor.observer,
      builder: (context, s) {
        _modelUI = s.data ?? _modelUI;
        return ScreenFormer(
          streamLoadingStatus: _interactor.observerLoading,
          titleActions: _buildTitle(),
          children: [
            _buildContent(),
            ${nameModule}W(interactor: _interactor),
          ],
        );
      },
    );
  }

  Widget _buildTitle() {
    return TitleForm(
      nameTitle: Strings.text.emptyString,
      typeBackAction: TypeBackAction.close,
    );
  }


  Widget _buildContent() {
    return const SizedBox.shrink();
  }
}
''';
String get sContent => '''
import 'package:flutter/cupertino.dart';

abstract class ${nameModule}Listener<T extends StatefulWidget> implements State<T> {
  Future<R?> onSomeMethod<R>();
}
''';
String get tContent => '''
import 'package:$namePackage/services/settings.dart';

import '../i_$fName.dart';

class ${nameModule}W extends StatelessWidget {
  const ${nameModule}W({
    Key? key,
    required ${nameModule}Interactor interactor,
  }) : _interactor = interactor, super(key: key);

  final ${nameModule}Interactor _interactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: InkCustomSimple(
        onTap: _interactor.onSomeMethod,
        child: Container(
          alignment: const Alignment(0, 0),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: DesignStyles.buttonDecoration(
            blurRadius: 10,
            borderRadius: 10,
            offset: const Offset(0, 2),
            colorBoxShadow: DesignStyles.colorDark,
            color: DesignStyles.colorDark,
          ),
          child: Text(
            'Screen: $nameModule',
            style: DesignStyles.textCustom(
              fontSize: 24,
              color: DesignStyles.colorLight,
            ),
          ),
        ),
      ),
    );
  }
}
''';
String get mContent => '''
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part '${fName}_model.freezed.dart';
part '${fName}_model.g.dart';

@freezed
class ${nameModule}ModelResponse with _\$${nameModule}ModelResponse {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory ${nameModule}ModelResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'user') SecondModule? secondModel,
  }) = _${nameModule}ModelResponse;

  factory ${nameModule}ModelResponse.fromJson(Map<String, dynamic> json) => _\$${nameModule}ModelResponseFromJson(json);
}

@freezed
class SecondModule with _\$SecondModule {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory SecondModule({
    @JsonKey(name: 's') String? s,
  }) = _SecondModule;

  factory SecondModule.fromJson(Map<String, dynamic> json) => _\$SecondModuleFromJson(json);
}
''';
String get muContent => '''
import '$mFileName';

class ${nameModule}ModelUI {
  final SecondModuleUI secondModel;
  final SecondModule? model;
  ${nameModule}ModelUI(
    this.secondModel,
    this.model,
  );
}

class SecondModuleUI {
  final String string;

  SecondModuleUI(
    this.string,
  );
}
''';
String get dContent => '''
import 'package:flutter/foundation.dart';
import 'package:$namePackage/services/settings.dart';

import '../models/$mFileName';

class ${nameModule}Api {
  final _dio = AppApi.dio;

  Future<${nameModule}ModelResponse?> get$nameModule() async {
    ${nameModule}ModelResponse? result;
    final body = {};
    final response = await _dio.get(
      'truck',
      // data: body,
    );

    final data = response.data as Map<String, dynamic>?;

    if (data != null) {
      result = await compute<Map<String, dynamic>, ${nameModule}ModelResponse>(
        _parse${nameModule}Model,
        data,
      );
    }

    return result;
  }

  static Future<${nameModule}ModelResponse> _parse${nameModule}Model(
    Map<String, dynamic> body,
  ) async {
    return ${nameModule}ModelResponse.fromJson(body);
  }
}

''';
String get fgContent => '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '$mFileName';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _\$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

${nameModule}ModelResponse _\$${nameModule}ModelResponseFromJson(Map<String, dynamic> json) {
  return _${nameModule}ModelResponse.fromJson(json);
}

/// @nodoc
class _\$${nameModule}ModelResponseTearOff {
  const _\$${nameModule}ModelResponseTearOff();

  _${nameModule}ModelResponse call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel}) {
    return _${nameModule}ModelResponse(
      code: code,
      message: message,
      secondModel: secondModel,
    );
  }

  ${nameModule}ModelResponse fromJson(Map<String, Object?> json) {
    return ${nameModule}ModelResponse.fromJson(json);
  }
}

/// @nodoc
const \$${nameModule}ModelResponse = _\$${nameModule}ModelResponseTearOff();

/// @nodoc
mixin _\$${nameModule}ModelResponse {
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  SecondModule? get secondModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  \$${nameModule}ModelResponseCopyWith<${nameModule}ModelResponse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class \$${nameModule}ModelResponseCopyWith<\$Res> {
  factory \$${nameModule}ModelResponseCopyWith(${nameModule}ModelResponse value, \$Res Function(${nameModule}ModelResponse) then) =
      _\$${nameModule}ModelResponseCopyWithImpl<\$Res>;
  \$Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel});

  \$SecondModuleCopyWith<\$Res>? get secondModel;
}

/// @nodoc
class _\$${nameModule}ModelResponseCopyWithImpl<\$Res> implements \$${nameModule}ModelResponseCopyWith<\$Res> {
  _\$${nameModule}ModelResponseCopyWithImpl(this._value, this._then);

  final ${nameModule}ModelResponse _value;
  // ignore: unused_field
  final \$Res Function(${nameModule}ModelResponse) _then;

  @override
  \$Res call({
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
  \$SecondModuleCopyWith<\$Res>? get secondModel {
    if (_value.secondModel == null) {
      return null;
    }

    return \$SecondModuleCopyWith<\$Res>(_value.secondModel!, (value) {
      return _then(_value.copyWith(secondModel: value));
    });
  }
}

/// @nodoc
abstract class _\$${nameModule}ModelResponseCopyWith<\$Res> implements \$${nameModule}ModelResponseCopyWith<\$Res> {
  factory _\$${nameModule}ModelResponseCopyWith(
          _${nameModule}ModelResponse value, \$Res Function(_${nameModule}ModelResponse) then) =
      __\$${nameModule}ModelResponseCopyWithImpl<\$Res>;
  @override
  \$Res call(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel});

  @override
  \$SecondModuleCopyWith<\$Res>? get secondModel;
}

/// @nodoc
class __\$${nameModule}ModelResponseCopyWithImpl<\$Res> extends _\$${nameModule}ModelResponseCopyWithImpl<\$Res>
    implements _\$${nameModule}ModelResponseCopyWith<\$Res> {
  __\$${nameModule}ModelResponseCopyWithImpl(_${nameModule}ModelResponse _value, \$Res Function(_${nameModule}ModelResponse) _then)
      : super(_value, (v) => _then(v as _${nameModule}ModelResponse));

  @override
  _${nameModule}ModelResponse get _value => super._value as _${nameModule}ModelResponse;

  @override
  \$Res call({
    Object? code = freezed,
    Object? message = freezed,
    Object? secondModel = freezed,
  }) {
    return _then(_${nameModule}ModelResponse(
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
class _\$_${nameModule}ModelResponse implements _${nameModule}ModelResponse {
  const _\$_${nameModule}ModelResponse(
      {@JsonKey(name: 'code') this.code,
      @JsonKey(name: 'message') this.message,
      @JsonKey(name: 'user') this.secondModel});

  factory _\$_${nameModule}ModelResponse.fromJson(Map<String, dynamic> json) => _\$\$_${nameModule}ModelResponseFromJson(json);

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
    return '${nameModule}ModelResponse(code: \$code, message: \$message, secondModel: \$secondModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _${nameModule}ModelResponse &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.secondModel, secondModel) || other.secondModel == secondModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, message, secondModel);

  @JsonKey(ignore: true)
  @override
  _\$${nameModule}ModelResponseCopyWith<_${nameModule}ModelResponse> get copyWith =>
      __\$${nameModule}ModelResponseCopyWithImpl<_${nameModule}ModelResponse>(this, _\$identity);

  @override
  Map<String, dynamic> toJson() {
    return _\$\$_${nameModule}ModelResponseToJson(this);
  }
}

abstract class _${nameModule}ModelResponse implements ${nameModule}ModelResponse {
  const factory _${nameModule}ModelResponse(
      {@JsonKey(name: 'code') int? code,
      @JsonKey(name: 'message') String? message,
      @JsonKey(name: 'user') SecondModule? secondModel}) = _\$_${nameModule}ModelResponse;

  factory _${nameModule}ModelResponse.fromJson(Map<String, dynamic> json) = _\$_${nameModule}ModelResponse.fromJson;

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
  _\$${nameModule}ModelResponseCopyWith<_${nameModule}ModelResponse> get copyWith => throw _privateConstructorUsedError;
}

SecondModule _\$SecondModuleFromJson(Map<String, dynamic> json) {
  return _SecondModule.fromJson(json);
}

/// @nodoc
class _\$SecondModuleTearOff {
  const _\$SecondModuleTearOff();

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
const \$SecondModule = _\$SecondModuleTearOff();

/// @nodoc
mixin _\$SecondModule {
  @JsonKey(name: 's')
  String? get s => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  \$SecondModuleCopyWith<SecondModule> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class \$SecondModuleCopyWith<\$Res> {
  factory \$SecondModuleCopyWith(SecondModule value, \$Res Function(SecondModule) then) =
      _\$SecondModuleCopyWithImpl<\$Res>;
  \$Res call({@JsonKey(name: 's') String? s});
}

/// @nodoc
class _\$SecondModuleCopyWithImpl<\$Res> implements \$SecondModuleCopyWith<\$Res> {
  _\$SecondModuleCopyWithImpl(this._value, this._then);

  final SecondModule _value;
  // ignore: unused_field
  final \$Res Function(SecondModule) _then;

  @override
  \$Res call({
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
abstract class _\$SecondModuleCopyWith<\$Res> implements \$SecondModuleCopyWith<\$Res> {
  factory _\$SecondModuleCopyWith(_SecondModule value, \$Res Function(_SecondModule) then) =
      __\$SecondModuleCopyWithImpl<\$Res>;
  @override
  \$Res call({@JsonKey(name: 's') String? s});
}

/// @nodoc
class __\$SecondModuleCopyWithImpl<\$Res> extends _\$SecondModuleCopyWithImpl<\$Res>
    implements _\$SecondModuleCopyWith<\$Res> {
  __\$SecondModuleCopyWithImpl(_SecondModule _value, \$Res Function(_SecondModule) _then)
      : super(_value, (v) => _then(v as _SecondModule));

  @override
  _SecondModule get _value => super._value as _SecondModule;

  @override
  \$Res call({
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
class _\$_SecondModule implements _SecondModule {
  const _\$_SecondModule({@JsonKey(name: 's') this.s});

  factory _\$_SecondModule.fromJson(Map<String, dynamic> json) => _\$\$_SecondModuleFromJson(json);

  @override
  @JsonKey(name: 's')
  final String? s;

  @override
  String toString() {
    return 'SecondModule(s: \$s)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SecondModule && (identical(other.s, s) || other.s == s));
  }

  @override
  int get hashCode => Object.hash(runtimeType, s);

  @JsonKey(ignore: true)
  @override
  _\$SecondModuleCopyWith<_SecondModule> get copyWith => __\$SecondModuleCopyWithImpl<_SecondModule>(this, _\$identity);

  @override
  Map<String, dynamic> toJson() {
    return _\$\$_SecondModuleToJson(this);
  }
}

abstract class _SecondModule implements SecondModule {
  const factory _SecondModule({@JsonKey(name: 's') String? s}) = _\$_SecondModule;

  factory _SecondModule.fromJson(Map<String, dynamic> json) = _\$_SecondModule.fromJson;

  @override
  @JsonKey(name: 's')
  String? get s;
  @override
  @JsonKey(ignore: true)
  _\$SecondModuleCopyWith<_SecondModule> get copyWith => throw _privateConstructorUsedError;
}

''';
String get jgContent => '''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of '$mFileName';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_\$_${nameModule}ModelResponse _\$\$_${nameModule}ModelResponseFromJson(Map<String, dynamic> json) => _\$_${nameModule}ModelResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      secondModel: json['user'] == null ? null : SecondModule.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _\$\$_${nameModule}ModelResponseToJson(_\$_${nameModule}ModelResponse instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'user': instance.secondModel?.toJson(),
    };

_\$_SecondModule _\$\$_SecondModuleFromJson(Map<String, dynamic> json) => _\$_SecondModule(
      s: json['s'] as String?,
    );

Map<String, dynamic> _\$\$_SecondModuleToJson(_\$_SecondModule instance) => <String, dynamic>{
      's': instance.s,
    };

''';

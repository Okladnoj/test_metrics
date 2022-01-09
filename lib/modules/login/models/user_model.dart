import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_mode_iu.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: true)
  const factory UserModel({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic>? json) => _$UserModelFromJson(json ?? {});
}

extension ToUserModelUI on UserModel {
  UserModelUI toUI() {
    return UserModelUI(
      name ?? '',
      email ?? '',
      this,
    );
  }
}

import 'package:core/core.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required String email,
    required String uid,
    required bool isAdmin,
    required bool isSuperAdmin,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic?> json) =>
      _$UserEntityFromJson(json);
}

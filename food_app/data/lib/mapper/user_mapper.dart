import 'package:domain/model/user_model.dart';

import '../entity/user/user_entity.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      email: model.email,
      uid: model.uid,
      isAdmin: model.isAdmin,
      isSuperAdmin: model.isSuperAdmin,
    );
  }

  static UserModel toModel(UserEntity entity) {
    return UserModel(
      email: entity.email,
      uid: entity.uid,
      isAdmin: entity.isAdmin,
      isSuperAdmin: entity.isSuperAdmin,
    );
  }
}

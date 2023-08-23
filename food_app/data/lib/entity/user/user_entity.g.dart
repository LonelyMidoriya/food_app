// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      email: json['email'] as String,
      uid: json['uid'] as String,
      isAdmin: json['isAdmin'] as bool,
      isSuperAdmin: json['isSuperAdmin'] as bool,
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'isAdmin': instance.isAdmin,
      'isSuperAdmin': instance.isSuperAdmin,
    };

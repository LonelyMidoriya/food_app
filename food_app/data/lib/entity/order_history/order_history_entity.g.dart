// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryEntity _$$_OrderHistoryEntityFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryEntity(
      carts: (json['carts'] as List<dynamic>)
          .map((e) => CartEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_OrderHistoryEntityToJson(
        _$_OrderHistoryEntity instance) =>
    <String, dynamic>{
      'carts': instance.carts.map((e) => e.toJson()),
      'email': instance.email,
    };

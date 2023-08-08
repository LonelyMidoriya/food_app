// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrdersEntity _$$_OrdersEntityFromJson(Map<String, dynamic> json) =>
    _$_OrdersEntity(
      carts: (json['carts'] as List<dynamic>)
          .map((e) => CartEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrdersEntityToJson(_$_OrdersEntity instance) =>
    <String, dynamic>{
      'carts': instance.carts.map((e) => e.toJson()),
    };

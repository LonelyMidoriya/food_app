// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartEntity _$$_CartEntityFromJson(Map<String, dynamic> json) =>
    _$_CartEntity(
      cost: (json['cost'] as num).toDouble(),
      id: json['id'] as int,
      date: json['date'] as String,
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => CartItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CartEntityToJson(_$_CartEntity instance) =>
    <String, dynamic>{
      'cost': instance.cost,
      'id': instance.id,
      'date': instance.date,
      'cartItems': instance.cartItems.map((e) => e.toJson()),
    };

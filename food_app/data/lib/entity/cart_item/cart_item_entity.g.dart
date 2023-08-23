// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItemEntity _$$_CartItemEntityFromJson(Map<String, dynamic> json) =>
    _$_CartItemEntity(
      dish: DishEntity.fromJson(json['dish'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_CartItemEntityToJson(_$_CartItemEntity instance) =>
    <String, dynamic>{
      'dish': instance.dish.toJson(),
      'count': instance.count,
    };

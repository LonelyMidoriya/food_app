// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItemEntity _$$_CartItemEntityFromJson(Map<String, dynamic> json) =>
    _$_CartItemEntity(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      cost: (json['cost'] as num).toDouble(),
      type: json['type'] as String,
      description: json['description'] as String,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_CartItemEntityToJson(_$_CartItemEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'cost': instance.cost,
      'type': instance.type,
      'description': instance.description,
      'count': instance.count,
    };

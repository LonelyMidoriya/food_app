// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DishEntity _$$_DishEntityFromJson(Map<String, dynamic> json) =>
    _$_DishEntity(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      cost: (json['cost'] as num).toDouble(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_DishEntityToJson(_$_DishEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'cost': instance.cost,
      'type': instance.type,
    };

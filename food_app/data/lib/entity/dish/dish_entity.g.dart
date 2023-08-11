// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DishEntityAdapter extends TypeAdapter<DishEntity> {
  @override
  final int typeId = 1;

  @override
  DishEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DishEntity(
      name: fields[0] as String,
      imageUrl: fields[1] as String,
      cost: fields[2] as double,
      type: fields[3] as String,
      description: fields[4] as String,
      stats: fields[5] as Map<dynamic, dynamic>,
    );
  }

  @override
  void write(BinaryWriter writer, DishEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.cost)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.stats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DishEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DishEntity _$$_DishEntityFromJson(Map<String, dynamic> json) =>
    _$_DishEntity(
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      cost: (json['cost'] as num).toDouble(),
      type: json['type'] as String,
      description: json['description'] as String,
      stats: Map<dynamic, dynamic>.from(json['stats'] as Map),
    );

Map<String, dynamic> _$$_DishEntityToJson(_$_DishEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'cost': instance.cost,
      'type': instance.type,
      'description': instance.description,
      'stats': instance.stats,
    };

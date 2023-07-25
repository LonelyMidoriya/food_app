import 'package:core/core.dart';

import 'dish_entity.dart';

class DishEntityAdapter extends TypeAdapter<DishEntity> {
  @override
  final typeId = 0;

  @override
  DishEntity read(BinaryReader reader) {
    final fieldsCount = reader.readByte();
    Map<String, dynamic> data = {};
    for (int i = 0; i < fieldsCount; i++) {
      final key = reader.readString();
      final value = reader.read();
      data[key] = value;
    }
    return DishEntity(
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      cost: data['cost'] ?? 0,
      description: data['description'] ?? '',
      type: data['type'] ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, DishEntity obj) {
    writer.writeByte(5);
    writer.writeString('name');
    writer.write(obj.name);
    writer.writeString('imageUrl');
    writer.write(obj.imageUrl);
    writer.writeString('cost');
    writer.write(obj.cost);
    writer.writeString('description');
    writer.write(obj.description);
    writer.writeString('type');
    writer.write(obj.type);
  }
}
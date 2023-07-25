import 'package:hive/hive.dart';

part 'dish_model.g.dart';

@HiveType(typeId: 1)
class DishModel extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final double cost;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final String description;

  DishModel({
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.type,
    required this.description,
  });
}

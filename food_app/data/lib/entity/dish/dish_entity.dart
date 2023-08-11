import 'package:core/core.dart';
part 'dish_entity.freezed.dart';
part 'dish_entity.g.dart';

@freezed
@HiveType(typeId: 1, adapterName: 'DishEntityAdapter')
class DishEntity extends HiveObject with _$DishEntity {
  DishEntity._();

  factory DishEntity({
    @HiveField(0) required String name,
    @HiveField(1) required String imageUrl,
    @HiveField(2) required double cost,
    @HiveField(3) required String type,
    @HiveField(4) required String description,
    @HiveField(5) required Map<dynamic, dynamic> stats,

  }) = _DishEntity;

  factory DishEntity.fromJson(Map<String, Object?> json) =>
      _$DishEntityFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_entity.freezed.dart';
part 'dish_entity.g.dart';

@freezed
class DishEntity with _$DishEntity {
  factory DishEntity({
    required String name,
    required String imageUrl,
    required double cost,
    required String type,
    required String description,
  }) = _DishEntity;

  factory DishEntity.fromJson(Map<String, Object?> json) =>
      _$DishEntityFromJson(json);
}
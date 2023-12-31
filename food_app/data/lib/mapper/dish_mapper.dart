import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class DishMapper {
  static DishEntity toEntity(DishModel model) {
    return DishEntity(
      name: model.name,
      imageUrl: model.imageUrl,
      cost: model.cost,
      type: model.type,
      description: model.description,
      stats: model.stats,
    );
  }

  static DishModel toModel(DishEntity entity) {
    return DishModel(
      name: entity.name,
      imageUrl: entity.imageUrl,
      cost: entity.cost,
      type: entity.type,
      description: entity.description,
      stats: entity.stats,
    );
  }
}

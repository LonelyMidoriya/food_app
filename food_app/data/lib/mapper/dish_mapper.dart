import 'package:data/entity/dish/dish_entity.dart';
import 'package:domain/model/dish_model.dart';

class DishMapper {
  DishEntity toEntity(DishModel model) {
    return DishEntity(
      name: model.name,
      imageUrl: model.imageUrl,
      cost: model.cost,
      type: model.type,
    );
  }

  DishModel toModel(DishEntity entity) {
    return DishModel(
      name: entity.name,
      imageUrl: entity.imageUrl,
      cost: entity.cost,
      type: entity.type,
    );
  }
}

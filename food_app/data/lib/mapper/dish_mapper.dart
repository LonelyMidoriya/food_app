import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class DishMapper {
  static DishEntity toEntity(DishModel model) {
    final List<ReviewEntity> reviews = model.reviews
        .map(
          (ReviewModel model) => ReviewMapper.toEntity(model),
    )
        .toList();
    return DishEntity(
      name: model.name,
      imageUrl: model.imageUrl,
      cost: model.cost,
      type: model.type,
      description: model.description,
      stats: model.stats,
      reviews: reviews,
    );
  }

  static DishModel toModel(DishEntity entity) {
    final List<ReviewModel> reviews = entity.reviews
        .map(
          (ReviewEntity entity) => ReviewMapper.toModel(entity),
    )
        .toList();
    return DishModel(
      name: entity.name,
      imageUrl: entity.imageUrl,
      cost: entity.cost,
      type: entity.type,
      description: entity.description,
      stats: entity.stats,
      reviews: reviews,
    );
  }
}

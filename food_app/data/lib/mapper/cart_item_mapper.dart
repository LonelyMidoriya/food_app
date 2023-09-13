import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class CartItemMapper {
  static CartItemEntity toEntity(CartItemModel model) {
    return CartItemEntity(
      dish: DishMapper.toEntity(model.dish),
      count: model.count,
    );
  }

  static CartItemModel toModel(CartItemEntity entity) {
    return CartItemModel(
      dish: DishMapper.toModel(entity.dish),
      count: entity.count,
    );
  }
}

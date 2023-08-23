import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartItemMapper {
  final DishMapper _dishMapper;
  CartItemMapper({
    required DishMapper dishMapper,
  }) : _dishMapper = dishMapper;

  CartItemEntity toEntity(CartItemModel model) {
    return CartItemEntity(
      dish: _dishMapper.toEntity(model.dish),
      count: model.count,
    );
  }

  CartItemModel toModel(CartItemEntity entity) {
    return CartItemModel(
      dish: _dishMapper.toModel(entity.dish),
      count: entity.count,
    );
  }
}

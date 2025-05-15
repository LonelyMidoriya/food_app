import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartMapper {
  static CartEntity toEntity(CartModel model) {
    final List<CartItemEntity> cartItems = model.cartItems
        .map(
          (CartItemModel model) => CartItemMapper.toEntity(model),
        )
        .toList();

    return CartEntity(
      status: model.status,
      cartItems: cartItems,
      cost: model.cost,
      id: model.id,
      date: model.date,
    );
  }

  static CartModel toModel(CartEntity entity) {
    final List<CartItemModel> cartItems = entity.cartItems
        .map(
          (CartItemEntity entity) => CartItemMapper.toModel(entity),
        )
        .toList();

    return CartModel(
      status: entity.status,
      cartItems: cartItems,
      cost: entity.cost,
      id: entity.id,
      date: entity.date,
    );
  }
}

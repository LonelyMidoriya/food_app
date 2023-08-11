import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartMapper {
  final CartItemMapper _cartItemMapper;

  const CartMapper({required CartItemMapper cartItemMapper})
      : _cartItemMapper = cartItemMapper;

  CartEntity toEntity(CartModel model) {
    final List<CartItemEntity> cartItems = model.cartItems
        .map(
          (CartItemModel model) => _cartItemMapper.toEntity(model),
        )
        .toList();

    return CartEntity(
      cartItems: cartItems,
      cost: model.cost,
      id: model.id,
      date: model.date,
    );
  }

  CartModel toModel(CartEntity entity) {
    final List<CartItemModel> cartItems = entity.cartItems
        .map(
          (CartItemEntity entity) => _cartItemMapper.toModel(entity),
        )
        .toList();

    return CartModel(
      cartItems: cartItems,
      cost: entity.cost,
      id: entity.id,
      date: entity.date,
    );
  }
}

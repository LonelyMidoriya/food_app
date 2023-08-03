import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartMapper {
  final CartItemMapper _cartItemMapper;

  CartMapper(this._cartItemMapper);

  CartEntity toEntity(CartModel model) {
    final List<CartItemEntity> cartItems = [];
    for (CartItemModel itemModel in model.cartItems) {
      cartItems.add(_cartItemMapper.toEntity(itemModel));
    }
    return CartEntity(
      cartItems: cartItems,
      cost: model.cost,
      id: model.id,
      date: model.date,
    );
  }

  CartModel toModel(CartEntity entity) {
    final List<CartItemModel> cartItems = [];
    for (CartItemEntity itemEntity in entity.cartItems) {
      cartItems.add(_cartItemMapper.toModel(itemEntity));
    }
    return CartModel(
      cartItems: cartItems,
      cost: entity.cost,
      id: entity.id,
      date: entity.date,
    );
  }
}

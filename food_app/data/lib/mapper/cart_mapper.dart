import 'package:data/entity/cart/cart_entity.dart';
import 'package:data/entity/cart_item/cart_item_entity.dart';
import 'package:domain/model/cart_item_model.dart';
import 'package:domain/model/cart_model.dart';

import 'cart_item_mapper.dart';

class CartMapper {
  final CartItemMapper _cartItemMapper;

  CartMapper(this._cartItemMapper);

  CartEntity toEntity(CartModel model) {
    final List<CartItemEntity> cartItems = [];
    for(CartItemModel itemModel in model.cartItems){
      cartItems.add(_cartItemMapper.toEntity(itemModel));
    }
    return CartEntity(
      cartItems: cartItems,
    );
  }

  CartModel toModel(CartEntity entity) {
    final List<CartItemModel> cartItems = [];
    for(CartItemEntity itemEntity in entity.cartItems){
      cartItems.add(_cartItemMapper.toModel(itemEntity));
    }
    return CartModel(
      cartItems: cartItems,
    );
  }
}

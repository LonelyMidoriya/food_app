import 'package:data/entity/cart/cart_entity.dart';
import 'package:domain/model/cart_model.dart';

class CartMapper {
  CartEntity toEntity(CartModel model) {
    return CartEntity(
      dishes: model.dishes,
    );
  }

  CartModel toModel(CartEntity entity) {
    return CartModel(
      dishes: entity.dishes,
    );
  }
}

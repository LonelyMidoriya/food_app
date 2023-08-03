import 'package:domain/model/cart_model.dart';
import 'package:domain/model/orders_model.dart';
import '../entity/cart/cart_entity.dart';
import '../entity/orders/orders_entity.dart';
import 'cart_mapper.dart';

class OrdersMapper {
  final CartMapper _cartMapper;

  OrdersMapper(this._cartMapper);

  OrdersEntity toEntity(OrdersModel model) {
    final List<CartEntity> carts = [];
    for (CartModel itemModel in model.carts) {
      carts.add(_cartMapper.toEntity(itemModel));
    }
    return OrdersEntity(
      carts: carts,
    );
  }

  OrdersModel toModel(OrdersEntity entity) {
    final List<CartModel> carts = [];
    for (CartEntity itemEntity in entity.carts) {
      carts.add(_cartMapper.toModel(itemEntity));
    }
    return OrdersModel(
      carts: carts,
    );
  }
}

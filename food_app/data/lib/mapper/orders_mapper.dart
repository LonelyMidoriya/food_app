import 'package:domain/model/cart_model.dart';
import 'package:domain/model/orders_model.dart';
import '../entity/cart/cart_entity.dart';
import '../entity/orders/orders_entity.dart';
import 'cart_mapper.dart';

class OrdersMapper {
  final CartMapper cartMapper;

  OrdersMapper({required this.cartMapper});

  OrdersEntity toEntity(OrdersModel model) {
    final List<CartEntity> carts = model.carts
        .map(
          (CartModel model) => cartMapper.toEntity(model),
        )
        .toList();

    return OrdersEntity(
      carts: carts,
    );
  }

  OrdersModel toModel(OrdersEntity entity) {
    final List<CartModel> carts = entity.carts
        .map(
          (CartEntity entity) => cartMapper.toModel(entity),
        )
        .toList();

    return OrdersModel(
      carts: carts,
    );
  }
}

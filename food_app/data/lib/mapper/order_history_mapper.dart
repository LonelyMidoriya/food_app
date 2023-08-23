import 'package:domain/model/cart_model.dart';
import 'package:domain/model/order_history_model.dart';
import '../entity/cart/cart_entity.dart';
import '../entity/order_history/order_history_entity.dart';
import 'cart_mapper.dart';

class OrderHistoryMapper {
  final CartMapper _cartMapper;

  const OrderHistoryMapper({required CartMapper cartMapper})
      : _cartMapper = cartMapper;

  OrderHistoryEntity toEntity(OrderHistoryModel model) {
    final List<CartEntity> carts = model.carts
        .map(
          (CartModel model) => _cartMapper.toEntity(model),
        )
        .toList();

    return OrderHistoryEntity(
      carts: carts,
      email: model.email,
    );
  }

  OrderHistoryModel toModel(OrderHistoryEntity entity) {
    final List<CartModel> carts = entity.carts
        .map(
          (CartEntity entity) => _cartMapper.toModel(entity),
        )
        .toList();

    return OrderHistoryModel(
      carts: carts,
      email: entity.email,
    );
  }
}

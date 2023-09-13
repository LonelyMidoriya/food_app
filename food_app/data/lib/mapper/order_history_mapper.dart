import 'package:domain/model/cart_model.dart';
import 'package:domain/model/order_history_model.dart';
import '../entity/cart/cart_entity.dart';
import '../entity/order_history/order_history_entity.dart';
import 'cart_mapper.dart';

abstract class OrderHistoryMapper {
  static OrderHistoryEntity toEntity(OrderHistoryModel model) {
    final List<CartEntity> carts = model.carts
        .map(
          (CartModel model) => CartMapper.toEntity(model),
        )
        .toList();

    return OrderHistoryEntity(
      carts: carts,
      email: model.email,
    );
  }

  static OrderHistoryModel toModel(OrderHistoryEntity entity) {
    final List<CartModel> carts = entity.carts
        .map(
          (CartEntity entity) => CartMapper.toModel(entity),
        )
        .toList();

    return OrderHistoryModel(
      carts: carts,
      email: entity.email,
    );
  }
}

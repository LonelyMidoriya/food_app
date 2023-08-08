import 'package:core/core.dart';

import '../cart/cart_entity.dart';

part 'orders_entity.freezed.dart';
part 'orders_entity.g.dart';

@freezed
class OrdersEntity with _$OrdersEntity {
  factory OrdersEntity({
    required List<CartEntity> carts,
  }) = _OrdersEntity;

  factory OrdersEntity.fromJson(Map<String, Object?> json) =>
      _$OrdersEntityFromJson(json);
}

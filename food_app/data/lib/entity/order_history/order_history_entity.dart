import 'package:core/core.dart';

import '../cart/cart_entity.dart';

part 'order_history_entity.freezed.dart';
part 'order_history_entity.g.dart';

@freezed
class OrderHistoryEntity with _$OrdersEntity {
  factory OrderHistoryEntity({
    required List<CartEntity> carts,
  }) = _OrdersEntity;

  factory OrderHistoryEntity.fromJson(Map<String, Object?> json) =>
      _$OrdersEntityFromJson(json);
}

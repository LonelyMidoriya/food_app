import 'package:core/core.dart';

import '../cart/cart_entity.dart';

part 'order_history_entity.freezed.dart';
part 'order_history_entity.g.dart';

@freezed
class OrderHistoryEntity with _$OrderHistoryEntity {
  factory OrderHistoryEntity({
    required List<CartEntity> carts,
    required String email,
  }) = _OrderHistoryEntity;

  factory OrderHistoryEntity.fromJson(Map<String, Object?> json) =>
      _$OrderHistoryEntityFromJson(json);
}

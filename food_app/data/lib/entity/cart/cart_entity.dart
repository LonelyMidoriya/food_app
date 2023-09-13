import 'package:core/core.dart';

import '../cart_item/cart_item_entity.dart';

part 'cart_entity.freezed.dart';
part 'cart_entity.g.dart';

@freezed
class CartEntity with _$CartEntity {
  factory CartEntity({
    required double cost,
    required int id,
    required String date,
    required List<CartItemEntity> cartItems,
  }) = _CartEntity;

  factory CartEntity.fromJson(Map<String, Object?> json) =>
      _$CartEntityFromJson(json);
}

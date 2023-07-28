

import 'package:core/core.dart';

part 'cart_item_entity.freezed.dart';
part 'cart_item_entity.g.dart';

@freezed
class CartItemEntity with _$CartItemEntity {
  factory CartItemEntity({
    required String name,
    required String imageUrl,
    required double cost,
    required String type,
    required String description,
    required int count,
  }) = _CartItemEntity;

  factory CartItemEntity.fromJson(Map<String, dynamic?> json) =>
      _$CartItemEntityFromJson(json);
}
import 'package:core/core.dart';
import 'package:data/data.dart';

part 'cart_item_entity.freezed.dart';
part 'cart_item_entity.g.dart';

@freezed
class CartItemEntity with _$CartItemEntity {
  factory CartItemEntity({
    required DishEntity dish,
    required int count,
  }) = _CartItemEntity;

  factory CartItemEntity.fromJson(Map<String, dynamic?> json) =>
      _$CartItemEntityFromJson(json);
}
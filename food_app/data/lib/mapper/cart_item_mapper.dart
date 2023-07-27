import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartItemMapper {
  CartItemEntity toEntity(CartItemModel model) {
    return CartItemEntity(
      name: model.name,
      imageUrl: model.imageUrl,
      cost: model.cost,
      type: model.type,
      description: model.description,
      count: model.count,
    );
  }

  CartItemModel toModel(CartItemEntity entity) {
    return CartItemModel(
      name: entity.name,
      imageUrl: entity.imageUrl,
      cost: entity.cost,
      type: entity.type,
      description: entity.description,
      count: entity.count,
    );
  }
}

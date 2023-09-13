import 'dish_model.dart';

class CartItemModel {
  final DishModel dish;
  final int count;

  const CartItemModel({
    required this.dish,
    required this.count,
  });

  CartItemModel copyWith({
    DishModel? dish,
    int? count,
  }) =>
      CartItemModel(
        dish: dish ?? this.dish,
        count: count ?? this.count,
      );
}

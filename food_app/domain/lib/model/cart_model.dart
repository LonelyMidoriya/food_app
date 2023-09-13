import 'package:domain/model/cart_item_model.dart';

class CartModel {
  final double cost;
  final int id;
  final String date;
  final List<CartItemModel> cartItems;

  const CartModel({
    required this.cost,
    required this.id,
    required this.date,
    required this.cartItems,
  });

  CartModel copyWith({
    double? cost,
    int? id,
    String? date,
    List<CartItemModel>? cartItems,
    String? email,
  }) =>
      CartModel(
        cost: cost ?? this.cost,
        id: id ?? this.id,
        date: date ?? this.date,
        cartItems: cartItems ?? this.cartItems,
      );

  CartModel.empty()
      : cartItems = [],
        cost = 0,
        date = '',
        id = 0;
}

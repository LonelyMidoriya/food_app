import 'package:domain/model/cart_item_model.dart';

class CartModel {
  final String status;
  final double cost;
  final int id;
  final String date;
  final List<CartItemModel> cartItems;

  const CartModel({
    required this.status,
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
    String? status,
  }) =>
      CartModel(
        status: status ?? this.status,
        cost: cost ?? this.cost,
        id: id ?? this.id,
        date: date ?? this.date,
        cartItems: cartItems ?? this.cartItems,
      );

  CartModel.empty()
      : cartItems = [],
        status = '',
        cost = 0,
        date = '',
        id = 0;
}

import 'cart_model.dart';

class OrderHistoryModel {
  final List<CartModel> carts;
  final String email;

  const OrderHistoryModel({
    required this.carts,
    required this.email,
  });
}

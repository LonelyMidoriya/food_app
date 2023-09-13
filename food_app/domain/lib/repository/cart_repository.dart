import 'package:domain/model/cart_model.dart';

abstract class CartRepository {
  Future<CartModel> fetchCart();

  Future<void> updateCart(CartModel cart);
}

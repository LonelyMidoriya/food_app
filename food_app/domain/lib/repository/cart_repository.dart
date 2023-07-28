import 'package:domain/model/cart_model.dart';

abstract class CartRepository {
  Future<CartModel?> getCart();
  Future<void> updateCart(CartModel cart);
}

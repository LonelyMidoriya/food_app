import 'package:domain/model/cart_model.dart';

import '../model/dish_model.dart';

abstract class CartRepository {
  Future<DishModel> getDish(String name);
  Future<CartModel> getCart();
  Future<void> updateCart(Map<String, dynamic> cart);
}

import 'package:data/entity/cart/cart_entity.dart';
import 'package:domain/model/cart_model.dart';
import 'package:domain/repository/cart_repository.dart';

import '../mapper/cart_mapper.dart';
import '../provider/firestore_provider.dart';

class CartRepositoryImpl implements CartRepository {
  final FirestoreProvider _firestoreProvider;
  final CartMapper _cartMapper;

  CartRepositoryImpl(
    this._firestoreProvider,
    this._cartMapper,
  );

  @override
  Future<CartModel> getCart() async {
    late CartEntity cartEntity;

    await _firestoreProvider.getCart('cart', 1).then(
      (value) {
        cartEntity = CartEntity.fromJson(value.data()!);
      },
    );

    return _cartMapper.toModel(cartEntity);
  }

  @override
  Future<void> updateCart(
    CartModel cart,
  ) async {
    print(_cartMapper.toEntity(cart).toJson());
    await _firestoreProvider.updateCart(
      _cartMapper.toEntity(cart).toJson(),
      'cart',
      1,
    );
  }
}
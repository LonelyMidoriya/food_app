import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final FirestoreProvider _firestoreProvider;
  final SharedPreferences _sharedPreferences;

  const CartRepositoryImpl({
    required FirestoreProvider firestoreProvider,
    required SharedPreferences sharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        _firestoreProvider = firestoreProvider;

  @override
  Future<CartModel> fetchCart() async {
    final CartEntity cartEntity = await _firestoreProvider.fetchCart(
      collection: 'cart',
      userId: _sharedPreferences.getString('uid')!,
    );
    return CartMapper.toModel(cartEntity);
  }

  @override
  Future<void> updateCart(
    CartModel cart,
  ) async {
    await _firestoreProvider.updateCart(
      cart: CartMapper.toEntity(cart),
      collection: 'cart',
      userId: _sharedPreferences.getString('uid')!,
    );
  }
}

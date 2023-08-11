import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final FirestoreProvider _firestoreProvider;
  final CartMapper _cartMapper;
  final SharedPreferences _sharedPreferences;

  const CartRepositoryImpl({
    required FirestoreProvider firestoreProvider,
    required CartMapper cartMapper,
    required SharedPreferences sharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        _cartMapper = cartMapper,
        _firestoreProvider = firestoreProvider;

  @override
  Future<CartModel> getCart() async {
    final CartEntity cartEntity;
    final Map<String, dynamic>? cartJson = await _firestoreProvider
        .getCart(
          collection: 'cart',
          userId: _sharedPreferences.getString('uid')!,
        ).then((value) => value.data());
    if (cartJson == null) {
      return CartModel.empty();
    }
    cartEntity = CartEntity.fromJson(cartJson);
    return _cartMapper.toModel(cartEntity);
  }

  @override
  Future<void> updateCart({
    required CartModel cart,
  }) async {
    await _firestoreProvider.updateCart(
      cart: _cartMapper.toEntity(cart).toJson(),
      collection: 'cart',
      userId: _sharedPreferences.getString('uid')!,
    );
  }
}

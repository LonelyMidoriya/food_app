import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final FirestoreProvider _firestoreProvider;
  final CartMapper _cartMapper;

  CartRepositoryImpl(
    this._firestoreProvider,
    this._cartMapper,
  );

  @override
  Future<CartModel> getCart() async {
    final CartEntity cartEntity;
    final Map<String, dynamic>? cartJson = await _firestoreProvider
        .getCart(
          'cart',
          appLocator.get<SharedPreferences>().getString('uid')!,
        )
        .then((value) => value.data());
    if (cartJson == null) {
      return CartModel(
        cartItems: [],
        cost: 0,
        id: 0,
        date: '',
      );
    }
    cartEntity = CartEntity.fromJson(cartJson);
    return _cartMapper.toModel(cartEntity);
  }

  @override
  Future<void> updateCart(
    CartModel cart,
  ) async {
    await _firestoreProvider.updateCart(
      _cartMapper.toEntity(cart).toJson(),
      'cart',
      appLocator.get<SharedPreferences>().getString('uid')!,
    );
  }
}

import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final FirestoreProvider firestoreProvider;
  final CartMapper cartMapper;

  CartRepositoryImpl({
    required this.firestoreProvider,
    required this.cartMapper,
  });

  @override
  Future<CartModel> getCart() async {
    final CartEntity cartEntity;
    final Map<String, dynamic>? cartJson = await firestoreProvider
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
    return cartMapper.toModel(cartEntity);
  }

  @override
  Future<void> updateCart({
    required CartModel cart,
  }) async {
    await firestoreProvider.updateCart(
      cartMapper.toEntity(cart).toJson(),
      'cart',
      appLocator.get<SharedPreferences>().getString('uid')!,
    );
  }
}

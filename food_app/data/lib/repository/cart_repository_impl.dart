import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CartRepositoryImpl implements CartRepository {
  final FirestoreProvider firestoreProvider;
  final CartMapper cartMapper;
  final SharedPreferences sharedPreferences;

  CartRepositoryImpl({
    required this.firestoreProvider,
    required this.cartMapper,
    required this.sharedPreferences,
  });

  @override
  Future<CartModel> getCart() async {
    final CartEntity cartEntity;
    final Map<String, dynamic>? cartJson = await firestoreProvider
        .getCart(
          collection: 'cart',
          userId: sharedPreferences.getString('uid')!,
        )
        .then((value) => value.data());
    if (cartJson == null) {
      return CartModel.empty();
    }
    cartEntity = CartEntity.fromJson(cartJson);
    return cartMapper.toModel(cartEntity);
  }

  @override
  Future<void> updateCart({
    required CartModel cart,
  }) async {
    await firestoreProvider.updateCart(
      cart: cartMapper.toEntity(cart).toJson(),
      collection: 'cart',
      userId: sharedPreferences.getString('uid')!,
    );
  }
}

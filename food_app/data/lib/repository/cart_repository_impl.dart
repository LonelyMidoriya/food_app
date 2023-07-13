import 'package:data/entity/cart/cart_entity.dart';
import 'package:domain/model/cart_model.dart';
import 'package:domain/model/dish_model.dart';
import 'package:domain/repository/cart_repository.dart';

import '../entity/dish/dish_entity.dart';
import '../mapper/cart_mapper.dart';
import '../mapper/dish_mapper.dart';
import '../provider/firestore_provider.dart';

class CartRepositoryImpl implements CartRepository {
  final FirestoreProvider _firestoreProvider;
  final DishMapper _dishMapper;
  final CartMapper _cartMapper;

  CartRepositoryImpl(
    this._firestoreProvider,
    this._dishMapper,
    this._cartMapper,
  );

  @override
  Future<DishModel> getDish(String name) async {
    List<DishModel> dish = [];
    await _firestoreProvider
        .getOne(
          name,
          'dishes',
        )
        .then(
          (value) => dish.add(
            _dishMapper.toModel(
              DishEntity.fromJson(
                value.docs.first.data(),
              ),
            ),
          ),
        );

    return dish[0];
  }

  @override
  Future<CartModel> getCart() async {
    Map<String, dynamic> listResult = {};

    await _firestoreProvider
        .getCart(
      'cart',
      1,
    )
        .then(
      (value) {
        listResult.addAll(value.data()!);
      },
    );
    CartEntity cartEntity = CartEntity(dishes: listResult);
    return _cartMapper.toModel(cartEntity);
  }

  @override
  Future<void> updateCart(
    Map<String, dynamic> cart,
  ) async {
    await _firestoreProvider.updateCart(
      cart,
      'cart',
      1,
    );
  }
}

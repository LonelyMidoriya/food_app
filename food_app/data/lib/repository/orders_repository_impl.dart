import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/model/orders_model.dart';
import 'package:domain/repository/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final FirestoreProvider firestoreProvider;
  final OrdersMapper ordersMapper;
  final SharedPreferences sharedPreferences;

  OrdersRepositoryImpl({
    required this.firestoreProvider,
    required this.ordersMapper,
    required this.sharedPreferences,
  });

  @override
  Future<OrdersModel> getOrders() async {
    final OrdersEntity ordersEntity;
    final Map<String, dynamic>? ordersJson = await firestoreProvider
        .getCart(
          collection: 'orders',
          userId: sharedPreferences.getString('uid')!,
        )
        .then((value) => value.data());
    if (ordersJson == null) {
      return OrdersModel(
        carts: [],
      );
    }
    ordersEntity = OrdersEntity.fromJson(ordersJson);
    return ordersMapper.toModel(ordersEntity);
  }

  @override
  Future<void> updateOrders({
    required OrdersModel cart,
  }) async {
    await firestoreProvider.updateCart(
      cart: ordersMapper.toEntity(cart).toJson(),
      collection: 'orders',
      userId: sharedPreferences.getString('uid')!,
    );
  }
}

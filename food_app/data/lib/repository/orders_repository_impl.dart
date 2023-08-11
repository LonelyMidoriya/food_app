import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/model/order_history_model.dart';
import 'package:domain/repository/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final FirestoreProvider _firestoreProvider;
  final OrderHistoryMapper _ordersMapper;
  final SharedPreferences _sharedPreferences;

  const OrdersRepositoryImpl({
    required FirestoreProvider firestoreProvider,
    required OrderHistoryMapper ordersMapper,
    required SharedPreferences sharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        _ordersMapper = ordersMapper,
        _firestoreProvider = firestoreProvider;

  @override
  Future<OrderHistoryModel> getOrders() async {
    final OrderHistoryEntity ordersEntity;
    final Map<String, dynamic>? ordersJson = await _firestoreProvider
        .getCart(
          collection: 'orders',
          userId: _sharedPreferences.getString('uid')!,
        ).then((value) => value.data());

    if (ordersJson == null) {
      return const OrderHistoryModel(
        carts: [],
      );
    }
    ordersEntity = OrderHistoryEntity.fromJson(ordersJson);
    return _ordersMapper.toModel(ordersEntity);
  }

  @override
  Future<void> updateOrders({
    required OrderHistoryModel orders,
  }) async {
    await _firestoreProvider.updateCart(
      cart: _ordersMapper.toEntity(orders).toJson(),
      collection: 'orders',
      userId: _sharedPreferences.getString('uid')!,
    );
  }
}

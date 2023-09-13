import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/model/order_history_model.dart';
import 'package:domain/repository/order_history_repository.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final FirestoreProvider _firestoreProvider;
  final SharedPreferences _sharedPreferences;

  const OrderHistoryRepositoryImpl({
    required FirestoreProvider firestoreProvider,
    required SharedPreferences sharedPreferences,
  })  : _sharedPreferences = sharedPreferences,
        _firestoreProvider = firestoreProvider;

  @override
  Future<OrderHistoryModel> fetchOrders() async {
    final OrderHistoryEntity ordersEntity =
        await _firestoreProvider.fetchOrderHistory(
      collection: 'orders',
      userId: _sharedPreferences.getString('uid')!,
    );

    return OrderHistoryMapper.toModel(ordersEntity);
  }

  @override
  Future<void> updateOrders(
    OrderHistoryModel orders,
  ) async {
    await _firestoreProvider.updateOrderHistory(
      orders: OrderHistoryMapper.toEntity(orders),
      collection: 'orders',
      userId: _sharedPreferences.getString('uid')!,
    );
  }

  @override
  Future<List<OrderHistoryModel>> fetchAllUsersOrders() async {
    final List<OrderHistoryModel> orders = [];

    final List<OrderHistoryEntity> entities =
        await _firestoreProvider.fetchAllUsersOrderHistory('orders');

    for (OrderHistoryEntity entity in entities) {
      orders.add(OrderHistoryMapper.toModel(entity));
    }

    return orders;
  }

  @override
  Future<List<OrderHistoryModel>> fetchSearchedUsersOrders(
      String searchQuery) async {
    final List<OrderHistoryModel> orders = [];

    final List<OrderHistoryEntity> entities =
        await _firestoreProvider.fetchSearchedUsersOrderHistory(
      collection: 'orders',
      searchQuery: searchQuery,
    );

    for (OrderHistoryEntity entity in entities) {
      orders.add(OrderHistoryMapper.toModel(entity));
    }

    return orders;
  }
}

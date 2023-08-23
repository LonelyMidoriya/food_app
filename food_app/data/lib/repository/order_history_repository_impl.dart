import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/model/order_history_model.dart';
import 'package:domain/repository/order_history_repository.dart';

class OrderHistoryRepositoryImpl implements OrderHistoryRepository {
  final FirestoreProvider _firestoreProvider;
  final OrderHistoryMapper _ordersMapper;
  final SharedPreferences _sharedPreferences;

  const OrderHistoryRepositoryImpl({
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
        )
        .then((value) => value.data());

    if (ordersJson == null) {
      return const OrderHistoryModel(
        carts: [],
        email: '',
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

  @override
  Future<List<OrderHistoryModel>> getAllUsersOrders() async {
    final List<OrderHistoryModel> orders = [];

    await _firestoreProvider
        .getAllUsersOrderHistory(
      collection: 'orders',
    ).then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          orders.add(
            _ordersMapper.toModel(
              OrderHistoryEntity.fromJson(
                result.data(),
              ),
            ),
          );
        }
      },
    );

    return orders;
  }

  @override
  Future<List<OrderHistoryModel>> getSearchedUsersOrders(String searchQuery) async {
    final List<OrderHistoryModel> orders = [];

    await _firestoreProvider
        .getSearchedUsersOrderHistory(
      collection: 'orders', searchQuery: searchQuery,
    ).then(
          (QuerySnapshot<Map<String, dynamic>> value) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          orders.add(
            _ordersMapper.toModel(
              OrderHistoryEntity.fromJson(
                result.data(),
              ),
            ),
          );
        }
      },
    );

    return orders;
  }
}

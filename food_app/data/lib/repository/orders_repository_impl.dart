import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/model/orders_model.dart';
import 'package:domain/repository/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final FirestoreProvider _firestoreProvider;
  final OrdersMapper _ordersMapper;

  OrdersRepositoryImpl(
    this._firestoreProvider,
    this._ordersMapper,
  );

  @override
  Future<OrdersModel> getOrders() async {
    final OrdersEntity ordersEntity;
    final Map<String, dynamic>? ordersJson = await _firestoreProvider
        .getCart(
          'orders',
          appLocator.get<SharedPreferences>().getString('uid')!,
        )
        .then((value) => value.data());
    if (ordersJson == null) {
      return OrdersModel(
        carts: [],
      );
    }
    ordersEntity = OrdersEntity.fromJson(ordersJson);
    return _ordersMapper.toModel(ordersEntity);
  }

  @override
  Future<void> updateOrders(
    OrdersModel cart,
  ) async {
    await _firestoreProvider.updateCart(
      _ordersMapper.toEntity(cart).toJson(),
      'orders',
      appLocator.get<SharedPreferences>().getString('uid')!,
    );
  }
}

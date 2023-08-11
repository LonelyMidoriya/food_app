import '../model/orders_model.dart';

abstract class OrdersRepository {
  Future<OrdersModel> getOrders();

  Future<void> updateOrders({required OrdersModel cart});
}

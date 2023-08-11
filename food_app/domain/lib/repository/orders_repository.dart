import '../model/order_history_model.dart';

abstract class OrdersRepository {
  Future<OrderHistoryModel> getOrders();

  Future<void> updateOrders({required OrderHistoryModel orders});
}

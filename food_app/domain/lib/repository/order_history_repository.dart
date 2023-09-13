import '../model/order_history_model.dart';

abstract class OrderHistoryRepository {
  Future<OrderHistoryModel> fetchOrders();

  Future<List<OrderHistoryModel>> fetchAllUsersOrders();

  Future<void> updateOrders(OrderHistoryModel orders);

  Future<List<OrderHistoryModel>> fetchSearchedUsersOrders(String searchQuery);
}

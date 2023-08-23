import '../model/order_history_model.dart';

abstract class OrderHistoryRepository {
  Future<OrderHistoryModel> getOrders();

  Future<List<OrderHistoryModel>> getAllUsersOrders();

  Future<void> updateOrders({required OrderHistoryModel orders});

  Future<List<OrderHistoryModel>> getSearchedUsersOrders(String searchQuery);
}

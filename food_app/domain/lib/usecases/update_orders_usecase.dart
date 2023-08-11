import 'package:domain/usecases/usecase.dart';

import '../model/order_history_model.dart';
import '../repository/orders_repository.dart';

class UpdateOrdersUseCase implements FutureUseCase<OrderHistoryModel, void> {
  final OrdersRepository _ordersRepository;

  const UpdateOrdersUseCase({
    required OrdersRepository ordersRepository,
  }) : _ordersRepository = ordersRepository;

  @override
  Future<void> execute(OrderHistoryModel input) async {
    _ordersRepository.updateOrders(orders: input);
  }
}

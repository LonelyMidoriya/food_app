import 'package:domain/usecases/usecase.dart';

import '../model/order_history_model.dart';
import '../repository/order_history_repository.dart';

class UpdateOrdersUseCase implements FutureUseCase<OrderHistoryModel, void> {
  final OrderHistoryRepository _ordersRepository;

  const UpdateOrdersUseCase({
    required OrderHistoryRepository ordersRepository,
  }) : _ordersRepository = ordersRepository;

  @override
  Future<void> execute(OrderHistoryModel input) async {
    _ordersRepository.updateOrders(orders: input);
  }
}

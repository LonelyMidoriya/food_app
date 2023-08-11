import 'package:domain/usecases/usecase.dart';

import '../model/order_history_model.dart';
import '../repository/orders_repository.dart';

class GetOrdersUseCase implements FutureUseCase<NoParams, OrderHistoryModel> {
  final OrdersRepository _ordersRepository;

  const GetOrdersUseCase({
    required OrdersRepository ordersRepository,
  }) : _ordersRepository = ordersRepository;

  @override
  Future<OrderHistoryModel> execute(NoParams input) async {
    return _ordersRepository.getOrders();
  }
}

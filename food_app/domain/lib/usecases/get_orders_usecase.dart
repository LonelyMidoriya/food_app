import 'package:domain/usecases/usecase.dart';

import '../model/order_history_model.dart';
import '../repository/order_history_repository.dart';

class GetOrdersUseCase implements FutureUseCase<NoParams, OrderHistoryModel> {
  final OrderHistoryRepository _ordersRepository;

  const GetOrdersUseCase({
    required OrderHistoryRepository ordersRepository,
  }) : _ordersRepository = ordersRepository;

  @override
  Future<OrderHistoryModel> execute(NoParams input) async {
    return _ordersRepository.getOrders();
  }
}

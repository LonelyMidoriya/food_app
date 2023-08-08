import 'package:domain/usecases/usecase.dart';

import '../model/orders_model.dart';
import '../repository/orders_repository.dart';

class GetOrdersUseCase implements FutureUseCase<NoParams, OrdersModel> {
  final OrdersRepository _ordersRepository;

  const GetOrdersUseCase({
    required OrdersRepository ordersRepository,
  }) : _ordersRepository = ordersRepository;

  @override
  Future<OrdersModel> execute(NoParams input) async {
    return _ordersRepository.getOrders();
  }
}

import 'package:domain/usecases/usecase.dart';

import '../model/orders_model.dart';
import '../repository/orders_repository.dart';

class UpdateOrdersUseCase implements FutureUseCase<OrdersModel, void> {
  final OrdersRepository _ordersRepository;

  const UpdateOrdersUseCase({
    required OrdersRepository ordersRepository,
  }) : _ordersRepository = ordersRepository;

  @override
  Future<void> execute(OrdersModel input) async {
    _ordersRepository.updateOrders(cart: input);
  }
}

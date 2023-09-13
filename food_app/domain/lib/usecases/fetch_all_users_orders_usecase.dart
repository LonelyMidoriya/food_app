import 'package:domain/domain.dart';

class GetAllUsersOrdersUseCase
    implements FutureUseCase<NoParams, List<OrderHistoryModel>> {
  final OrderHistoryRepository _orderHistoryRepository;

  const GetAllUsersOrdersUseCase({
    required OrderHistoryRepository orderHistoryRepository,
  }) : _orderHistoryRepository = orderHistoryRepository;

  @override
  Future<List<OrderHistoryModel>> execute(NoParams input) async {
    return _orderHistoryRepository.fetchAllUsersOrders();
  }
}

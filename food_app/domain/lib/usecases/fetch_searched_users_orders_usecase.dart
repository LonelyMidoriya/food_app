import 'package:domain/domain.dart';

class FetchSearchedUsersOrdersUseCase
    implements FutureUseCase<String, List<OrderHistoryModel>> {
  final OrderHistoryRepository _orderHistoryRepository;

  const FetchSearchedUsersOrdersUseCase({
    required OrderHistoryRepository orderHistoryRepository,
  }) : _orderHistoryRepository = orderHistoryRepository;

  @override
  Future<List<OrderHistoryModel>> execute(String input) async {
    return _orderHistoryRepository.fetchSearchedUsersOrders(input);
  }
}

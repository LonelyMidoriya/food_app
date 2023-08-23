import 'package:domain/domain.dart';

class GetSearchedUsersOrdersUseCase
    implements FutureUseCase<String, List<OrderHistoryModel>> {
  final OrderHistoryRepository _orderHistoryRepository;

  const GetSearchedUsersOrdersUseCase({
    required OrderHistoryRepository orderHistoryRepository,
  }) : _orderHistoryRepository = orderHistoryRepository;

  @override
  Future<List<OrderHistoryModel>> execute(String input) async {
    return _orderHistoryRepository.getSearchedUsersOrders(input);
  }
}

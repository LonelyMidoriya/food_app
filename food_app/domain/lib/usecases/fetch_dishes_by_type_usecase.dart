import 'package:domain/domain.dart';

class FetchDishesByTypeUseCase
    implements FutureUseCase<String, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const FetchDishesByTypeUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<List<DishModel>> execute(String input) async {
    return _dishesRepository.fetchAllDishesByType(input);
  }
}

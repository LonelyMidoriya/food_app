import 'package:domain/domain.dart';

class GetDishesByTypeUseCase
    implements FutureUseCase<String, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const GetDishesByTypeUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<List<DishModel>> execute(String input) async {
    return _dishesRepository.getAllDishesByType(type: input);
  }
}

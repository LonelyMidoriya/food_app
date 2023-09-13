import 'package:domain/domain.dart';

class FetchInitDishesUseCase implements FutureUseCase<NoParams, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const FetchInitDishesUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<List<DishModel>> execute(NoParams input) async {
    return _dishesRepository.fetchFirstDishes();
  }
}

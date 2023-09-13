import 'package:domain/domain.dart';

class FetchNextDishesUseCase implements FutureUseCase<NoParams, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const FetchNextDishesUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<List<DishModel>> execute(NoParams input) async {
    return _dishesRepository.fetchNextDishes();
  }
}

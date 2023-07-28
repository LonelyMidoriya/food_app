import 'package:domain/usecases/usecase.dart';
import 'package:domain/domain.dart';

class GetNextDishesUseCase implements FutureUseCase<NoParams, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const GetNextDishesUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<List<DishModel>> execute(NoParams input) async {
    return _dishesRepository.getNextDishes();
  }
}

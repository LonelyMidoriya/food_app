import 'package:domain/usecases/usecase.dart';
import 'package:domain/domain.dart';

class GetInitDishesUseCase implements FutureUseCase<bool, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const GetInitDishesUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<List<DishModel>> execute(bool input) async {
    return _dishesRepository.getFirstDishes(input);
  }
}

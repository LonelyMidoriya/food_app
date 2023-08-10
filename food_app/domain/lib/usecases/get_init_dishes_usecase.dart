import 'package:domain/domain.dart';

class GetInitDishesUseCase implements FutureUseCase<NoParams, List<DishModel>> {
  final DishesRepository _dishesRepository;

  const GetInitDishesUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<List<DishModel>> execute(NoParams input) async {
    return _dishesRepository.getFirstDishes();
  }
}

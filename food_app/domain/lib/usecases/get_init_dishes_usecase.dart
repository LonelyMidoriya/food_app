import 'package:domain/usecases/usecase.dart';

import '../model/dish_model.dart';
import '../repository/dishes_repository.dart';

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
import 'package:domain/usecases/usecase.dart';

import '../model/dish_model.dart';
import '../repository/dishes_repository.dart';

class UpdateDishUseCase implements FutureUseCase<List<DishModel>, void> {
  final DishesRepository _dishesRepository;

  const UpdateDishUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<void> execute(List<DishModel> input) async {
    _dishesRepository.updateDish(dishes: input);
  }
}

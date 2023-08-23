import 'package:domain/domain.dart';

class AddDishUseCase implements FutureUseCase<DishModel, void> {
  final DishesRepository _dishesRepository;

  const AddDishUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<void> execute(DishModel input) async {
    _dishesRepository.addDish(dish: input);
  }
}

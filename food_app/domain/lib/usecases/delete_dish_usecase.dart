import 'package:domain/domain.dart';

class DeleteDishUseCase implements FutureUseCase<DishModel, void> {
  final DishesRepository _dishesRepository;

  const DeleteDishUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<void> execute(DishModel input) async {
    _dishesRepository.deleteDish(input);
  }
}

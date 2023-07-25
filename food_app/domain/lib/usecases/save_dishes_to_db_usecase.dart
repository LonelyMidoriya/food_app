import 'package:domain/usecases/usecase.dart';

import '../repository/dishes_repository.dart';

class SaveDishesToDBUsecase implements FutureUseCase<NoParams, void> {
  final DishesRepository _dishesRepository;

  const SaveDishesToDBUsecase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<void> execute(NoParams input) async {
    _dishesRepository.saveDishesToDB();
  }
}

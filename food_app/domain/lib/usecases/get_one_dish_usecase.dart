import 'package:domain/model/dish_model.dart';
import 'package:domain/repository/dishes_repository.dart';
import 'package:domain/usecases/usecase.dart';

class GetOneDishUseCase implements FutureUseCase<String, DishModel> {
  final DishesRepository _dishesRepository;

  const GetOneDishUseCase({
    required DishesRepository dishesRepository,
  }) : _dishesRepository = dishesRepository;

  @override
  Future<DishModel> execute(String input) async {
    return _dishesRepository.getDish(input);
  }
}
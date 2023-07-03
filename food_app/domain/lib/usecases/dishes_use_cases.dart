import 'package:domain/repository/dishes_repository.dart';

import '../model/dish_model.dart';

class DishesUseCase {
  final DishesRepository _dishesRepository;

  DishesUseCase(
    this._dishesRepository,
  );

  @override
  Future<DishModel> getDish(String name) async {
    return _dishesRepository.getDish(name);
  }

  @override
  Future<List<DishModel>> getFirstDishes() async {
    return _dishesRepository.getFirstDishes();
  }

  @override
  Future<List<DishModel>> getAllDishes() async {
    return _dishesRepository.getAllDishes();
  }

  @override
  Future<List<DishModel>> getAllDishesByType(String type) async {
    return _dishesRepository.getAllDishesByType(type);
  }
}

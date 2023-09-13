import '../model/dish_model.dart';

abstract class DishesRepository {
  Future<List<DishModel>> fetchNextDishes();

  Future<List<DishModel>> fetchAllDishesByType(String dishType);

  Future<List<DishModel>> fetchFirstDishes();

  Future<void> addDish(DishModel dish);

  Future<void> deleteDish(DishModel dish);

  Future<void> updateDish(List<DishModel> dishes);
}

import '../model/dish_model.dart';

abstract class DishesRepository {
  Future<DishModel> getDish(String name);
  Future<List<DishModel>> getAllDishes();
  Future<List<DishModel>> getAllDishesByType(String type);
  Future<List<DishModel>> getFirstDishes();
}

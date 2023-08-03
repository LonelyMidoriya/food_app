import '../model/dish_model.dart';

abstract class DishesRepository {
  Future<List<DishModel>> getNextDishes();
  Future<List<DishModel>> getAllDishesByType(String type, bool hasInternet);
  Future<List<DishModel>> getFirstDishes(bool hasInternet);
}

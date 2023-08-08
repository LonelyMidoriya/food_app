import '../model/dish_model.dart';

abstract class DishesRepository {
  Future<List<DishModel>> getNextDishes();
  Future<List<DishModel>> getAllDishesByType({required String type});
  Future<List<DishModel>> getFirstDishes();
}

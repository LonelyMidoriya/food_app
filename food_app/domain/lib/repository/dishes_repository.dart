import '../model/dish_model.dart';

abstract class DishesRepository {
  Future<List<DishModel>> getNextDishes();

  Future<List<DishModel>> getAllDishesByType({required String dishType});

  Future<List<DishModel>> getFirstDishes();

  Future<void> addDish({required DishModel dish});

  Future<void> deleteDish({required DishModel dish});

  Future<void> updateDish({required List<DishModel> dishes});
}

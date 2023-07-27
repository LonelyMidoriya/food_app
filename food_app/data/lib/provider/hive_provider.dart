import 'package:core/core.dart';
import 'package:domain/model/dish_model.dart';

class HiveProvider {
  Future<void> saveDishesToDB(List<DishModel> dishes) async {
    final Box<DishModel> dishesBox = await Hive.openBox('dishes');
    for (DishModel model in dishes) {
      if (!dishesBox.containsKey(model.name)) {
        await dishesBox.put(model.name, model);
      }
    }
  }

  Future<List<DishModel>> getDishesFromDB() async {
    final Box<DishModel> dishesBox = await Hive.openBox('dishes');
    final List<DishModel> models = dishesBox.values.toList();
    models.sort(
      (a, b) => a.type.compareTo(b.type),
    );
    return models;
  }
}

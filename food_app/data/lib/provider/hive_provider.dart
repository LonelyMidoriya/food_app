import 'package:core/core.dart';
import '../entity/dish/dish_entity.dart';

class HiveProvider {
  Future<void> saveDishesToDB(List<DishEntity> dishes) async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    for (DishEntity entity in dishes) {
      if (!dishesBox.containsKey(entity.name)) {
        await dishesBox.put(entity.name, entity);
      }
    }
  }

  Future<List<DishEntity>> getDishesFromDB() async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    final List<DishEntity> entities = dishesBox.values.toList();
    entities.sort(
      (a, b) => a.type.compareTo(b.type),
    );
    return entities;
  }
}

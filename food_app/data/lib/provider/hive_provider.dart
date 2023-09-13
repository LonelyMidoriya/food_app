import 'package:core/core.dart';
import '../entity/dish/dish_entity.dart';

class HiveProvider {
  Future<void> saveDishes(
    List<DishEntity> dishes,
  ) async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    for (DishEntity entity in dishes) {
      if (!dishesBox.containsKey(entity.name)) {
        await dishesBox.put(entity.name, entity);
      }
    }
  }

  Future<void> clearDishes() async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');

    await dishesBox.clear();
  }

  Future<List<DishEntity>> getDishes() async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    final List<DishEntity> entities = dishesBox.values.toList();
    entities.sort(
      (a, b) => a.type.compareTo(b.type),
    );
    return entities;
  }

  Future<List<DishEntity>> fetchDishesByType(
    String type,
  ) async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    final List<DishEntity> entities = dishesBox.values.toList();
    final List<DishEntity> result = [];
    result.addAll(entities.where((element) => element.type == type));
    return result;
  }
}

import 'package:core/core.dart';

import '../entity/dish/dish_entity.dart';

class HiveProvider {
  Future<void> saveDishesToDB(List<DishEntity> dishes) async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    if (dishesBox.isEmpty) {
      await dishesBox.addAll(dishes);
    }
  }

  Future<List<DishEntity>> getDishesFromDB() async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    final List<DishEntity> entities = dishesBox.values.toList();
    return entities;
  }

  Future<double?> getTextSize() async {
    final Box<double> dishesBox = await Hive.openBox('settings');
    final double? textSize = dishesBox.get('textSize');
    return textSize;
  }

  Future<void> saveTextSize(double textSize) async {
    final Box<double> dishesBox = await Hive.openBox('settings');
    dishesBox.put('textSize', textSize);
  }
}

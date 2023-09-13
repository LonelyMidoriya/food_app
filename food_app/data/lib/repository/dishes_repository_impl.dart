import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class DishesRepositoryImpl implements DishesRepository {
  final String _collection = 'dishes';
  final FirestoreProvider _firestoreProvider;
  final HiveProvider _hiveProvider;
  final InternetConnection _internetConnection;

  DishesRepositoryImpl({
    required FirestoreProvider firestoreProvider,
    required HiveProvider hiveProvider,
    required InternetConnection internetConnection,
  })  : _internetConnection = internetConnection,
        _hiveProvider = hiveProvider,
        _firestoreProvider = firestoreProvider;

  @override
  Future<List<DishModel>> fetchFirstDishes() async {
    final List<DishModel> models = [];
    final List<DishEntity> entities;
    final bool hasInternet = await _internetConnection.hasInternetAccess;

    if (hasInternet) {
      entities = await _firestoreProvider.fetchFirstDishes(
        collection: _collection,
        limit: pageCount,
      );

      for (DishEntity entity in entities) {
        models.add(DishMapper.toModel(entity));
      }

      await _hiveProvider.clearDishes();

      await _hiveProvider.saveDishes(entities);
    } else {
      entities = await _hiveProvider.getDishes();

      for (DishEntity entity in entities) {
        models.add(DishMapper.toModel(entity));
      }
    }

    return models;
  }

  @override
  Future<List<DishModel>> fetchNextDishes() async {
    final List<DishModel> models = [];
    final List<DishEntity> entities;

    entities = await _firestoreProvider.fetchNextDishes(
      collection: _collection,
      limit: pageCount,
    );

    for (DishEntity entity in entities) {
      models.add(DishMapper.toModel(entity));
    }

    await _hiveProvider.saveDishes(entities);
    return models;
  }

  @override
  Future<List<DishModel>> fetchAllDishesByType(
    String dishType,
  ) async {
    List<DishModel> models = [];
    final List<DishEntity> entities;

    final bool hasInternet = await _internetConnection.hasInternetAccess;

    if (hasInternet) {
      entities = await _firestoreProvider.fetchAllDishesByType(
        collection: _collection,
        type: dishType,
      );

      for (DishEntity entity in entities) {
        models.add(DishMapper.toModel(entity));
      }

      await _hiveProvider.saveDishes(entities);
    } else {
      entities = await _hiveProvider.fetchDishesByType(dishType);

      for (DishEntity entity in entities) {
        models.add(DishMapper.toModel(entity));
      }
    }
    return models;
  }

  @override
  Future<void> addDish(DishModel dish) async {
    await _firestoreProvider.addDish(
      dish: DishMapper.toEntity(dish),
      collection: _collection,
    );
  }

  @override
  Future<void> updateDish(List<DishModel> dishes) async {
    await _firestoreProvider.updateDish(
      dishes: [
        DishMapper.toEntity(dishes[0]),
        DishMapper.toEntity(dishes[1]),
      ],
      collection: _collection,
    );
  }

  @override
  Future<void> deleteDish(DishModel dish) async {
    await _firestoreProvider.deleteDish(
      dish: DishMapper.toEntity(dish),
      collection: _collection,
    );
  }
}

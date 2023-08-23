import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class DishesRepositoryImpl implements DishesRepository {
  final String _collection = 'dishes';
  final FirestoreProvider _firestoreProvider;
  final HiveProvider _hiveProvider;
  final DishMapper _dishMapper;
  final InternetConnection _internetConnection;
  late QueryDocumentSnapshot<Map<String, dynamic>> _lastVisible;

  DishesRepositoryImpl({
    required FirestoreProvider firestoreProvider,
    required DishMapper dishMapper,
    required HiveProvider hiveProvider,
    required InternetConnection internetConnection,
  })  : _internetConnection = internetConnection,
        _dishMapper = dishMapper,
        _hiveProvider = hiveProvider,
        _firestoreProvider = firestoreProvider;

  @override
  Future<List<DishModel>> getFirstDishes() async {
    final List<DishModel> models = [];
    final List<DishEntity> entities;
    final bool hasInternet = await _internetConnection.hasInternetAccess;

    if (hasInternet) {
      entities = [];
      await _firestoreProvider
          .getFirstDocs(
        collection: _collection,
        limit: pageCount,
      )
          .then(
        (QuerySnapshot<Map<String, dynamic>> value) {
          _lastVisible = value.docs[value.size - 1];
          for (QueryDocumentSnapshot<Map<String, dynamic>> result
              in value.docs) {
            models.add(
              _dishMapper.toModel(
                DishEntity.fromJson(
                  result.data(),
                ),
              ),
            );
          }
        },
      );

      await _hiveProvider.clearDishes();

      for (DishModel model in models) {
        entities.add(_dishMapper.toEntity(model));
      }

      await _hiveProvider.saveDishes(dishes: entities);
    } else {
      entities = await _hiveProvider.getDishes();

      for (DishEntity entity in entities) {
        models.add(_dishMapper.toModel(entity));
      }
    }

    return models;
  }

  @override
  Future<List<DishModel>> getNextDishes() async {
    final List<DishModel> models = [];
    final List<DishEntity> entities = [];

    await _firestoreProvider
        .getNextDocs(
      collection: _collection,
      limit: pageCount,
      lastVisible: _lastVisible,
    )
        .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        _lastVisible = value.docs[value.size - 1];
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          models.add(
            _dishMapper.toModel(
              DishEntity.fromJson(
                result.data(),
              ),
            ),
          );
        }
      },
    );

    for (DishModel model in models) {
      entities.add(_dishMapper.toEntity(model));
    }

    await _hiveProvider.saveDishes(dishes: entities);
    return models;
  }

  @override
  Future<List<DishModel>> getAllDishesByType({
    required String dishType,
  }) async {
    List<DishModel> models = [];
    final List<DishEntity> entities;

    final bool hasInternet = await _internetConnection.hasInternetAccess;

    if (hasInternet) {
      entities = [];
      await _firestoreProvider
          .getAllByType(
        collection: _collection,
        type: dishType,
      )
          .then(
        (QuerySnapshot<Map<String, dynamic>> value) {
          for (QueryDocumentSnapshot<Map<String, dynamic>> result
              in value.docs) {
            models.add(
              _dishMapper.toModel(
                DishEntity.fromJson(
                  result.data(),
                ),
              ),
            );
          }
        },
      );

      for (DishModel model in models) {
        entities.add(_dishMapper.toEntity(model));
      }

      await _hiveProvider.saveDishes(dishes: entities);
    } else {
      entities = await _hiveProvider.getDishesByType(type: dishType);

      for (DishEntity entity in entities) {
        models.add(_dishMapper.toModel(entity));
      }
    }
    return models;
  }

  @override
  Future<void> addDish({required DishModel dish}) async {
    await _firestoreProvider.addDish(
      dish: _dishMapper.toEntity(dish).toJson(),
      collection: _collection,
    );
  }

  @override
  Future<void> updateDish({required List<DishModel> dishes}) async {
    await _firestoreProvider.updateDish(
      dishes: [
        _dishMapper.toEntity(dishes[0]).toJson(),
        _dishMapper.toEntity(dishes[1]).toJson()
      ],
      collection: _collection,
    );
  }

  @override
  Future<void> deleteDish({required DishModel dish}) async {
    await _firestoreProvider.deleteDish(
      dish: _dishMapper.toEntity(dish).toJson(),
      collection: _collection,
    );
  }
}

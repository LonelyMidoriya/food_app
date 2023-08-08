import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class DishesRepositoryImpl implements DishesRepository {
  final String docName = 'dishes';
  final FirestoreProvider firestoreProvider;
  final HiveProvider hiveProvider;
  final DishMapper dishMapper;
  QueryDocumentSnapshot<Map<String, dynamic>>? _lastVisible;

  DishesRepositoryImpl({
    required this.firestoreProvider,
    required this.dishMapper,
    required this.hiveProvider,
  });

  @override
  Future<List<DishModel>> getFirstDishes() async {
    final List<DishModel> models = [];
    final List<DishEntity> entities;
    final bool hasInternet =
        await appLocator.get<InternetConnection>().hasInternetAccess;

    if (hasInternet) {
      entities = [];
      await firestoreProvider.getFirstDocs(docName, pageCount).then(
        (QuerySnapshot<Map<String, dynamic>> value) {
          _lastVisible = value.docs[value.size - 1];
          for (QueryDocumentSnapshot<Map<String, dynamic>> result
              in value.docs) {
            models.add(
              dishMapper.toModel(
                DishEntity.fromJson(
                  result.data(),
                ),
              ),
            );
          }
        },
      );

      for (DishModel model in models) {
        entities.add(dishMapper.toEntity(model));
      }

      await hiveProvider.saveDishes(entities);
    } else {
      entities = await hiveProvider.getDishes();

      for (DishEntity entity in entities) {
        models.add(dishMapper.toModel(entity));
      }
    }

    return models;
  }

  @override
  Future<List<DishModel>> getNextDishes() async {
    final List<DishModel> models = [];
    final List<DishEntity> entities = [];

    await firestoreProvider.getNextDocs(docName, pageCount, _lastVisible!).then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        _lastVisible = value.docs[value.size - 1];
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          models.add(
            dishMapper.toModel(
              DishEntity.fromJson(
                result.data(),
              ),
            ),
          );
        }
      },
    );

    for (DishModel model in models) {
      entities.add(dishMapper.toEntity(model));
    }

    await hiveProvider.saveDishes(entities);
    return models;
  }

  @override
  Future<List<DishModel>> getAllDishesByType({
    required String type,
  }) async {
    List<DishModel> models = [];
    final List<DishEntity> entities;

    final bool hasInternet =
        await appLocator.get<InternetConnection>().hasInternetAccess;

    if (hasInternet) {
      entities = [];
      await firestoreProvider.getAllByType(docName, type).then(
        (QuerySnapshot<Map<String, dynamic>> value) {
          for (QueryDocumentSnapshot<Map<String, dynamic>> result
              in value.docs) {
            models.add(
              dishMapper.toModel(
                DishEntity.fromJson(
                  result.data(),
                ),
              ),
            );
          }
        },
      );

      for (DishModel model in models) {
        entities.add(dishMapper.toEntity(model));
      }

      await hiveProvider.saveDishes(entities);
    } else {
      entities = await hiveProvider.getDishesByType(type);

      for (DishEntity entity in entities) {
        models.add(dishMapper.toModel(entity));
      }
    }
    return models;
  }
}

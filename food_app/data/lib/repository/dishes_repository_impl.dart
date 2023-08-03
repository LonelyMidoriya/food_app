import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class DishesRepositoryImpl implements DishesRepository {
  final FirestoreProvider _firestoreProvider;
  final HiveProvider _hiveProvider;
  final DishMapper _dishMapper;
  QueryDocumentSnapshot<Map<String, dynamic>>? _lastVisible;

  DishesRepositoryImpl(
    this._firestoreProvider,
    this._dishMapper,
    this._hiveProvider,
  );

  @override
  Future<List<DishModel>> getFirstDishes(bool hasInternet) async {
    final List<DishModel> listResult = [];
    final List<DishEntity> listEntities;

    if (hasInternet) {
      listEntities = [];
      await _firestoreProvider.getFirstDocs('dishes', pageCount).then(
        (value) {
          _lastVisible = value.docs[value.size - 1];
          for (QueryDocumentSnapshot<Map<String, dynamic>> result
              in value.docs) {
            listResult.add(
              _dishMapper.toModel(
                DishEntity.fromJson(
                  result.data(),
                ),
              ),
            );
          }
        },
      );

      for (DishModel model in listResult) {
        listEntities.add(_dishMapper.toEntity(model));
      }

      await _hiveProvider.saveDishesToDB(listEntities);
    } else {
      listEntities = await _hiveProvider.getDishesFromDB();

      for (DishEntity entity in listEntities) {
        listResult.add(_dishMapper.toModel(entity));
      }
    }

    return listResult;
  }

  @override
  Future<List<DishModel>> getNextDishes() async {
    final List<DishModel> listResult = [];
    final List<DishEntity> listEntities = [];

    await _firestoreProvider
        .getNextDocs('dishes', pageCount, _lastVisible!)
        .then(
      (value) {
        _lastVisible = value.docs[value.size - 1];
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          listResult.add(
            _dishMapper.toModel(
              DishEntity.fromJson(
                result.data(),
              ),
            ),
          );
        }
      },
    );

    for (DishModel model in listResult) {
      listEntities.add(_dishMapper.toEntity(model));
    }

    await _hiveProvider.saveDishesToDB(listEntities);
    return listResult;
  }

  @override
  Future<List<DishModel>> getAllDishesByType(
      String type, bool hasInternet) async {
    List<DishModel> listResult = [];
    final List<DishEntity> listEntities;

    if (hasInternet) {
      listEntities = [];
      await _firestoreProvider.getAllByType('dishes', type).then(
        (value) {
          for (QueryDocumentSnapshot<Map<String, dynamic>> result
              in value.docs) {
            listResult.add(
              _dishMapper.toModel(
                DishEntity.fromJson(
                  result.data(),
                ),
              ),
            );
          }
        },
      );

      for (DishModel model in listResult) {
        listEntities.add(_dishMapper.toEntity(model));
      }

      await _hiveProvider.saveDishesToDB(listEntities);
    } else {
      listEntities = await _hiveProvider.getDishesByTypeFromDB(type);

      for (DishEntity entity in listEntities) {
        listResult.add(_dishMapper.toModel(entity));
      }
    }
    return listResult;
  }
}

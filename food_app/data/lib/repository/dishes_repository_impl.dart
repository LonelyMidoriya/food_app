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
    List<DishModel> listResult = [];
    if (hasInternet) {
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
      await _hiveProvider.saveDishesToDB(listResult);
    } else {
      listResult = await _hiveProvider.getDishesFromDB();
    }

    return listResult;
  }

  @override
  Future<List<DishModel>> getNextDishes() async {
    List<DishModel> listResult = [];

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
    await _hiveProvider.saveDishesToDB(listResult);
    return listResult;
  }

  @override
  Future<List<DishModel>> getAllDishesByType(String type) async {
    List<DishModel> listResult = [];

    await _firestoreProvider.getAllByType('dishes', pageCount, type).then(
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
    return listResult;
  }
}

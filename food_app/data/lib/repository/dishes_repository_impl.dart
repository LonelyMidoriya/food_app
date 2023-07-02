import 'package:core/consts/consts.dart';
import 'package:core/core.dart';
import 'package:data/entity/dish/dish_entity.dart';
import 'package:domain/model/dish_model.dart';
import 'package:domain/repository/dishes_repository.dart';

import '../mapper/dish_mapper.dart';
import '../provider/firestore_provider.dart';

class DishesRepositoryImpl implements DishesRepository {
  final FirestoreProvider _firestoreProvider;
  final DishMapper _dishMapper;
  QueryDocumentSnapshot<Map<String, dynamic>>? _lastVisible;

  DishesRepositoryImpl(this._firestoreProvider, this._dishMapper);

  @override
  Future<DishModel> getDish(String name) async {
    final DishEntity dish = await _firestoreProvider.getOne(
      name,
      'dishes',
    );
    return _dishMapper.toModel(dish);
  }

  @override
  Future<List<DishModel>> getFirstDishes() async {
    List<DishModel> listResult = [];

    await _firestoreProvider
        .getFirstDocs(
      'dishes',
      pageCount,
    )
        .then((value) {
      _lastVisible = value.docs[value.size - 1];
      for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
        listResult.add(_dishMapper.toModel(DishEntity.fromJson(result.data())));
      }
    });
    return listResult;
  }

  @override
  Future<List<DishModel>> getAllDishes() async {
    List<DishModel> listResult = [];

    await _firestoreProvider
        .getAllDocs(
      'dishes',
      pageCount,
      _lastVisible,
    )
        .then((value) {
      _lastVisible = value.docs[value.size - 1];
      for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
        listResult.add(_dishMapper.toModel(DishEntity.fromJson(result.data())));
      }
    });
    return listResult;
  }

  @override
  Future<List<DishModel>> getAllDishesByType(String type) async {
    List<DishModel> listResult = [];
    await _firestoreProvider
        .getAllByType(
      'dishes',
      pageCount,
      type,
    )
        .then((value) {
      _lastVisible = value.docs[value.size - 1];
      for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
        listResult.add(_dishMapper.toModel(DishEntity.fromJson(result.data())));
      }
    });
    return listResult;
  }
}

import 'package:data/mapper/dish_mapper.dart';
import 'package:data/provider/firestore_provider.dart';
import 'package:data/repository/dishes_repository_impl.dart';
import 'package:domain/repository/dishes_repository.dart';
import 'package:domain/usecases/dishes_use_cases.dart';

import 'app_di.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirestore();
    _initDishesMapper();
    _initDishes();
  }

  void _initFirestore() {
    i.registerLazySingleton<FirestoreProvider>(
      () => FirestoreProviderImpl(),
    );
  }

  void _initDishesMapper() {
    i.registerLazySingleton<DishMapper>(
      () => DishMapper(),
    );
  }

  void _initDishes() {
    i.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        i.get(),
        i.get(),
      ),
    );
    i.registerLazySingleton<DishesUseCase>(
      () => DishesUseCaseImpl(
        i.get(),
      ),
    );
  }
}

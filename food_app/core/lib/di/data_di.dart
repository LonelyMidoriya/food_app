import 'package:data/mapper/cart_item_mapper.dart';
import 'package:data/mapper/cart_mapper.dart';
import 'package:data/mapper/dish_mapper.dart';
import 'package:data/provider/firestore_provider.dart';
import 'package:data/repository/cart_repository_impl.dart';
import 'package:data/repository/dishes_repository_impl.dart';
import 'package:domain/repository/cart_repository.dart';
import 'package:domain/repository/dishes_repository.dart';
import 'package:domain/usecases/get_cart_usecase.dart';
import 'package:domain/usecases/get_dishes_by_type_usecase.dart';
import 'package:domain/usecases/get_init_dishes_usecase.dart';
import 'package:domain/usecases/get_next_dishes_usecase.dart';
import 'package:domain/usecases/update_cart_usecase.dart';

import 'app_di.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirestore();
    _initMappers();
    _initRepositories();
    _initUsecases();
  }

  void _initFirestore() {
    appLocator.registerLazySingleton<FirestoreProvider>(
      () => FirestoreProvider(),
    );
  }

  void _initMappers() {
    appLocator.registerLazySingleton<DishMapper>(
      () => DishMapper(),
    );
    appLocator.registerLazySingleton<CartMapper>(
      () => CartMapper(appLocator.get<CartItemMapper>()),
    );
    appLocator.registerLazySingleton<CartItemMapper>(
          () => CartItemMapper(),
    );
  }

  void _initUsecases() {
    appLocator.registerLazySingleton<GetDishesByTypeUseCase>(
      () => GetDishesByTypeUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<GetInitDishesUseCase>(
      () => GetInitDishesUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<GetNextDishesUseCase>(
      () => GetNextDishesUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<GetCartUseCase>(
      () => GetCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );
    appLocator.registerLazySingleton<UpdateCartUseCase>(
          () => UpdateCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );
  }

  void _initRepositories() {
    appLocator.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        appLocator.get(),
        appLocator.get(),
      ),
    );
    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        appLocator.get(),
        appLocator.get(),
      ),
    );
  }
}

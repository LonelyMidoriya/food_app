import 'package:core/core.dart';
import 'package:data/entity/dish/dish_entity_adapter.dart';
import 'package:data/mapper/cart_item_mapper.dart';
import 'package:data/mapper/cart_mapper.dart';
import 'package:data/mapper/dish_mapper.dart';
import 'package:data/provider/firestore_provider.dart';
import 'package:data/provider/hive_provider.dart';
import 'package:data/repository/cart_repository_impl.dart';
import 'package:data/repository/dishes_repository_impl.dart';
import 'package:data/repository/settings_repository_impl.dart';
import 'package:domain/repository/cart_repository.dart';
import 'package:domain/repository/dishes_repository.dart';
import 'package:domain/repository/settings_repository.dart';
import 'package:domain/usecases/get_cart_usecase.dart';
import 'package:domain/usecases/get_dishes_by_type_usecase.dart';
import 'package:domain/usecases/get_dishes_from_db_usecase.dart';
import 'package:domain/usecases/get_init_dishes_usecase.dart';
import 'package:domain/usecases/get_next_dishes_usecase.dart';
import 'package:domain/usecases/get_text_size_usecase.dart';
import 'package:domain/usecases/save_dishes_to_db_usecase.dart';
import 'package:domain/usecases/save_text_size_usecase.dart';
import 'package:domain/usecases/update_cart_usecase.dart';
import 'package:hive/hive.dart';

import 'app_di.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirestore();
    _initMappers();
    _initRepositories();
    _initUsecases();
    _initAdapter();
    _initHive();
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

  void _initAdapter() {
    appLocator.registerLazySingleton<DishEntityAdapter>(
      () => DishEntityAdapter(),
    );
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
      appLocator.get<DishEntityAdapter>(),
    );
    appLocator.registerLazySingleton<HiveProvider>(
      () => HiveProvider(),
    );
  }

  void _initUsecases() {
    appLocator.registerLazySingleton<GetDishesByTypeUseCase>(
      () => GetDishesByTypeUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<GetDishesFromDBUseCase>(
      () => GetDishesFromDBUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<SaveDishesToDBUsecase>(
      () => SaveDishesToDBUsecase(
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
    appLocator.registerLazySingleton<GetTextSizeUseCase>(
      () => GetTextSizeUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );
    appLocator.registerLazySingleton<SaveTextSizeUseCase>(
      () => SaveTextSizeUseCase(
        settingsRepository: appLocator.get<SettingsRepository>(),
      ),
    );
  }

  void _initRepositories() {
    appLocator.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        appLocator.get(),
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
    appLocator.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        appLocator.get(),
      ),
    );
  }
}

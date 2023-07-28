import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirestore();
    _initMappers();
    _initRepositories();
    _initUsecases();
    _initAdapter();
    _initHive();
    _initInternetConnection();
    _initPrefs();
    _initGoogleSignIn();
    _initAuth();
  }

  Future<void> _initGoogleSignIn() async {
    appLocator.registerLazySingleton<GoogleSignIn>(
      () => GoogleSignIn(),
    );
  }

  void _initFirestore() {
    appLocator.registerLazySingleton<FirestoreProvider>(
      () => FirestoreProvider(),
    );
  }

  void _initAuth() {
    appLocator.registerLazySingleton<AuthProvider>(
      () => AuthProvider(
        googleSignIn: appLocator.get(),
      ),
    );
  }

  void _initInternetConnection() {
    appLocator.registerLazySingleton<InternetConnection>(
      () => InternetConnection(),
    );
  }

  void _initMappers() {
    appLocator.registerLazySingleton<DishMapper>(
      () => DishMapper(),
    );
    appLocator.registerLazySingleton<CartMapper>(
      () => CartMapper(
        appLocator.get<CartItemMapper>(),
      ),
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

  Future<void> _initPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    appLocator.registerLazySingleton<SharedPreferences>(
      () => prefs,
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
    appLocator.registerLazySingleton<SignUpWithEmailAndPasswordUsecase>(
      () => SignUpWithEmailAndPasswordUsecase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );
    appLocator.registerLazySingleton<LogInUsecase>(
      () => LogInUsecase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );
    appLocator.registerLazySingleton<SignOutUsecase>(
      () => SignOutUsecase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );
    appLocator.registerLazySingleton<SignUpWithGoogleUsecase>(
      () => SignUpWithGoogleUsecase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );
    appLocator.registerLazySingleton<InitUserUsecase>(
      () => InitUserUsecase(
        authRepository: appLocator.get<AuthRepository>(),
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
    appLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        appLocator.get(),
        appLocator.get(),
      ),
    );
  }
}

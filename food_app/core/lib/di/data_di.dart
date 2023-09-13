import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/repository/order_history_repository_impl.dart';
import 'package:domain/domain.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirestore();
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
      () => FirestoreProvider(FirebaseFirestore.instance),
    );
  }

  void _initAuth() {
    appLocator.registerLazySingleton<AuthProvider>(
      () => AuthProvider(
        googleSignIn: appLocator.get<GoogleSignIn>(),
        firebaseAuth: FirebaseAuth.instance,
      ),
    );
  }

  void _initInternetConnection() {
    appLocator.registerLazySingleton<InternetConnection>(
      () => InternetConnection(),
    );
  }

  void _initAdapter() {
    appLocator.registerLazySingleton<DishEntityAdapter>(
      () => DishEntityAdapter(),
    );
  }

  Future<void> _initPrefs() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    appLocator.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
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
    appLocator.registerLazySingleton<AddDishUseCase>(
      () => AddDishUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<UpdateDishUseCase>(
          () => UpdateDishUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<DeleteDishUseCase>(
      () => DeleteDishUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchDishesByTypeUseCase>(
      () => FetchDishesByTypeUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<GetAllUsersOrdersUseCase>(
      () => GetAllUsersOrdersUseCase(
        orderHistoryRepository: appLocator.get<OrderHistoryRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchSearchedUsersOrdersUseCase>(
      () => FetchSearchedUsersOrdersUseCase(
        orderHistoryRepository: appLocator.get<OrderHistoryRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchInitDishesUseCase>(
      () => FetchInitDishesUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchNextDishesUseCase>(
      () => FetchNextDishesUseCase(
        dishesRepository: appLocator.get<DishesRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchCartUseCase>(
      () => FetchCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );
    appLocator.registerLazySingleton<UpdateCartUseCase>(
      () => UpdateCartUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchTextSizeUseCase>(
      () => FetchTextSizeUseCase(
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
    appLocator.registerLazySingleton<CheckIfLoggedInUsecase>(
      () => CheckIfLoggedInUsecase(
        authRepository: appLocator.get<AuthRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchOrdersUseCase>(
      () => FetchOrdersUseCase(
        ordersRepository: appLocator.get<OrderHistoryRepository>(),
      ),
    );
    appLocator.registerLazySingleton<UpdateOrdersUseCase>(
      () => UpdateOrdersUseCase(
        ordersRepository: appLocator.get<OrderHistoryRepository>(),
      ),
    );
    appLocator.registerLazySingleton<AddUserUseCase>(
      () => AddUserUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchUserUseCase>(
      () => FetchUserUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchAllUsersUseCase>(
      () => FetchAllUsersUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );
    appLocator.registerLazySingleton<FetchSearchedUsersUseCase>(
      () => FetchSearchedUsersUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );
    appLocator.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(
        userRepository: appLocator.get<UserRepository>(),
      ),
    );
  }

  void _initRepositories() {
    appLocator.registerLazySingleton<DishesRepository>(
      () => DishesRepositoryImpl(
        firestoreProvider: appLocator.get<FirestoreProvider>(),
        hiveProvider: appLocator.get<HiveProvider>(),
        internetConnection: appLocator.get<InternetConnection>(),
      ),
    );
    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        firestoreProvider: appLocator.get<FirestoreProvider>(),
        sharedPreferences: appLocator.get<SharedPreferences>(),
      ),
    );
    appLocator.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        sharedPreferences: appLocator.get<SharedPreferences>(),
      ),
    );
    appLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authProvider: appLocator.get<AuthProvider>(),
        sharedPreferences: appLocator.get<SharedPreferences>(),
      ),
    );
    appLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        firestoreProvider: appLocator.get<FirestoreProvider>(),
        sharedPreferences: appLocator.get<SharedPreferences>(),
      ),
    );
    appLocator.registerLazySingleton<OrderHistoryRepository>(
      () => OrderHistoryRepositoryImpl(
        firestoreProvider: appLocator.get<FirestoreProvider>(),
        sharedPreferences: appLocator.get<SharedPreferences>(),
      ),
    );
  }
}

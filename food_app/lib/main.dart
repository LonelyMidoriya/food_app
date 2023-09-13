import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AdaptiveThemeMode? savedThemeMode = await AdaptiveTheme.getThemeMode();
  await appDI.initDependencies();
  runApp(
    MyApp(
      savedThemeMode: savedThemeMode,
    ),
  );
}

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({
    Key? key,
    this.savedThemeMode,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<AuthViewBloc>(
          create: (_) => AuthViewBloc(
            signUpWithEmailAndPasswordUsecase: appLocator.get<SignUpWithEmailAndPasswordUsecase>(),
            logInUsecase: appLocator.get<LogInUsecase>(),
            signOutUsecase: appLocator.get<SignOutUsecase>(),
            signUpWithGoogleUsecase: appLocator.get<SignUpWithGoogleUsecase>(),
            checkIfLoggedInUsecase: appLocator.get<CheckIfLoggedInUsecase>(),
            addUserUsecase: appLocator.get<AddUserUseCase>(),
            fetchUserUseCase: appLocator.get<FetchUserUseCase>(),
          )..add(
              AuthInitEvent(),
            ),
        ),
        BlocProvider<DishesViewBloc>(
          create: (_) => DishesViewBloc(
            fetchInitDishesUseCase: appLocator.get<FetchInitDishesUseCase>(),
            fetchNextDishesUseCase: appLocator.get<FetchNextDishesUseCase>(),
            fetchDishesByTypeUseCase: appLocator.get<FetchDishesByTypeUseCase>(),
            internetConnection: appLocator.get<InternetConnection>(),
            deleteDishUseCase: appLocator.get<DeleteDishUseCase>(),
            addDishUseCase: appLocator.get<AddDishUseCase>(),
            updateDishUseCase: appLocator.get<UpdateDishUseCase>(),
          )..add(
              InitDishesEvent(),
            ),
        ),
        BlocProvider<CartViewBloc>(
          create: (_) => CartViewBloc(
            fetchCartUseCase: appLocator.get<FetchCartUseCase>(),
            updateCartUseCase: appLocator.get<UpdateCartUseCase>(),
            internetConnection: appLocator.get<InternetConnection>(),
          ),
        ),
        BlocProvider<OrdersViewBloc>(
          create: (_) => OrdersViewBloc(
            fetchOrdersUseCase: appLocator.get<FetchOrdersUseCase>(),
            updateOrdersUseCase: appLocator.get<UpdateOrdersUseCase>(),
            internetConnection: appLocator.get<InternetConnection>(),
            getAllUsersOrdersUseCase:
                appLocator.get<GetAllUsersOrdersUseCase>(),
            getSearchedUsersOrdersUseCase:
                appLocator.get<FetchSearchedUsersOrdersUseCase>(),
          ),
        ),
        BlocProvider<SettingsViewBloc>(
          create: (_) => SettingsViewBloc(
            fetchTextSizeUseCase: appLocator.get<FetchTextSizeUseCase>(),
            saveTextSizeUseCase: appLocator.get<SaveTextSizeUseCase>(),
          )..add(
              GetTextSizeEvent(),
            ),
        ),
        BlocProvider<AdminControlPanelBloc>(
          create: (_) => AdminControlPanelBloc(
            fetchAllUsersUseCase: appLocator.get<FetchAllUsersUseCase>(),
            getSearchedUsersUseCase: appLocator.get<FetchSearchedUsersUseCase>(),
            updateUserUseCase: appLocator.get<UpdateUserUseCase>(),
            internetConnection: appLocator.get<InternetConnection>(),
          ),
        ),
      ],
      child: AdaptiveTheme(
        light: lightTheme,
        initial: widget.savedThemeMode ?? AdaptiveThemeMode.system,
        dark: darkTheme,
        builder: (theme, darkTheme) => MaterialApp.router(
          title: 'Flutter Demo',
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          theme: theme,
          darkTheme: darkTheme,
        ),
      ),
    );
  }
}

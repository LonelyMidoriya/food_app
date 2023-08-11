import 'package:auth_view/auth_view.dart';
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
            signUpUsecase: appLocator.get<SignUpWithEmailAndPasswordUsecase>(),
            logInUsecase: appLocator.get<LogInUsecase>(),
            signOutUsecase: appLocator.get<SignOutUsecase>(),
            signUpWithGoogleUsecase: appLocator.get<SignUpWithGoogleUsecase>(),
            initUserUsecase: appLocator.get<CheckIfLoggedInUsecase>(),
          )..add(
              AuthInitEvent(),
            ),
        ),
        BlocProvider<DishesViewBloc>(
          create: (_) => DishesViewBloc(
            getInitDishesUseCase: appLocator.get<GetInitDishesUseCase>(),
            getNextDishesUseCase: appLocator.get<GetNextDishesUseCase>(),
            getDishesByTypeUseCase: appLocator.get<GetDishesByTypeUseCase>(),
            internetConnection: appLocator.get<InternetConnection>(),
          )..add(
              InitDishesEvent(),
            ),
        ),
        BlocProvider<CartViewBloc>(
          create: (_) => CartViewBloc(
            getCartUseCase: appLocator.get<GetCartUseCase>(),
            updateCartUseCase: appLocator.get<UpdateCartUseCase>(),
            internetConnection: appLocator.get<InternetConnection>(),
          ),
        ),
        BlocProvider<OrdersViewBloc>(
          create: (_) => OrdersViewBloc(
            getOrdersUseCase: appLocator.get<GetOrdersUseCase>(),
            updateOrdersUseCase: appLocator.get<UpdateOrdersUseCase>(),
            internetConnection: appLocator.get<InternetConnection>(),
          ),
        ),
        BlocProvider<SettingsViewBloc>(
          create: (_) => SettingsViewBloc(
            getTextSizeUseCase: appLocator.get<GetTextSizeUseCase>(),
            saveTextSizeUseCase: appLocator.get<SaveTextSizeUseCase>(),
          )..add(
              InitEvent(),
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

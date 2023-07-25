import 'package:cart_view/cart_view.dart';
import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/theme/dark_theme.dart';
import 'package:core_ui/theme/light_theme.dart';
import 'package:dishes_view/dishes_view.dart';
import 'package:domain/usecases/get_cart_usecase.dart';
import 'package:domain/usecases/get_dishes_from_db_usecase.dart';
import 'package:domain/usecases/get_init_dishes_usecase.dart';
import 'package:domain/usecases/get_next_dishes_usecase.dart';
import 'package:domain/usecases/get_text_size_usecase.dart';
import 'package:domain/usecases/save_dishes_to_db_usecase.dart';
import 'package:domain/usecases/save_text_size_usecase.dart';
import 'package:domain/usecases/update_cart_usecase.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:settings_view/settings_view.dart';

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

  const MyApp({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DishesViewBloc>(
          create: (_) => DishesViewBloc(
            getInitDishesUseCase: appLocator.get<GetInitDishesUseCase>(),
            getNextDishesUseCase: appLocator.get<GetNextDishesUseCase>(),
            getDishesFromDBUseCase: appLocator.get<GetDishesFromDBUseCase>(),
            saveDishesToDBUsecase: appLocator.get<SaveDishesToDBUsecase>(),
          )..add(
              InitDishesEvent(),
            ),
        ),
        BlocProvider<CartViewBloc>(
          create: (_) => CartViewBloc(
            getCartUseCase: appLocator.get<GetCartUseCase>(),
            updateCartUseCase: appLocator.get<UpdateCartUseCase>(),
          )..add(
              InitCartEvent(),
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

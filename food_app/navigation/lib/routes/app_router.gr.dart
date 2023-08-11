// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SignupScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SignupScreen(),
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomePageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DishDescriptionPageRoute.name: (routeData) {
      final args = routeData.argsAs<DishDescriptionPageRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: DishDescriptionPage(
          key: args.key,
          model: args.model,
        ),
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DishesViewScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const DishesViewScreen(),
      );
    },
    OrdersViewScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const OrdersViewScreen(),
      );
    },
    CartViewScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const CartViewScreen(),
      );
    },
    SettingsViewScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SettingsViewScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SignupScreenRoute.name,
          path: '/signup-screen',
        ),
        RouteConfig(
          LoginScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          HomePageRoute.name,
          path: '/',
          children: [
            RouteConfig(
              DishesViewScreenRoute.name,
              path: 'dishes-view-screen',
              parent: HomePageRoute.name,
            ),
            RouteConfig(
              OrdersViewScreenRoute.name,
              path: 'orders-view-screen',
              parent: HomePageRoute.name,
            ),
            RouteConfig(
              CartViewScreenRoute.name,
              path: 'cart-view-screen',
              parent: HomePageRoute.name,
            ),
            RouteConfig(
              SettingsViewScreenRoute.name,
              path: 'settings-view-screen',
              parent: HomePageRoute.name,
            ),
          ],
        ),
        RouteConfig(
          DishDescriptionPageRoute.name,
          path: '/dish-description-page',
        ),
      ];
}

/// generated route for
/// [SignupScreen]
class SignupScreenRoute extends PageRouteInfo<void> {
  const SignupScreenRoute()
      : super(
          SignupScreenRoute.name,
          path: '/signup-screen',
        );

  static const String name = 'SignupScreenRoute';
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [DishDescriptionPage]
class DishDescriptionPageRoute
    extends PageRouteInfo<DishDescriptionPageRouteArgs> {
  DishDescriptionPageRoute({
    Key? key,
    required DishModel model,
  }) : super(
          DishDescriptionPageRoute.name,
          path: '/dish-description-page',
          args: DishDescriptionPageRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'DishDescriptionPageRoute';
}

class DishDescriptionPageRouteArgs {
  const DishDescriptionPageRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final DishModel model;

  @override
  String toString() {
    return 'DishDescriptionPageRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [DishesViewScreen]
class DishesViewScreenRoute extends PageRouteInfo<void> {
  const DishesViewScreenRoute()
      : super(
          DishesViewScreenRoute.name,
          path: 'dishes-view-screen',
        );

  static const String name = 'DishesViewScreenRoute';
}

/// generated route for
/// [OrdersViewScreen]
class OrdersViewScreenRoute extends PageRouteInfo<void> {
  const OrdersViewScreenRoute()
      : super(
          OrdersViewScreenRoute.name,
          path: 'orders-view-screen',
        );

  static const String name = 'OrdersViewScreenRoute';
}

/// generated route for
/// [CartViewScreen]
class CartViewScreenRoute extends PageRouteInfo<void> {
  const CartViewScreenRoute()
      : super(
          CartViewScreenRoute.name,
          path: 'cart-view-screen',
        );

  static const String name = 'CartViewScreenRoute';
}

/// generated route for
/// [SettingsViewScreen]
class SettingsViewScreenRoute extends PageRouteInfo<void> {
  const SettingsViewScreenRoute()
      : super(
          SettingsViewScreenRoute.name,
          path: 'settings-view-screen',
        );

  static const String name = 'SettingsViewScreenRoute';
}

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
    HomePageRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    DishDescriptionPageRoute.name: (routeData) {
      final args = routeData.argsAs<DishDescriptionPageRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: DishDescriptionPage(
          key: args.key,
          model: args.model,
        ),
      );
    },
    DishesViewScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const DishesViewScreen(),
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
          HomePageRoute.name,
          path: '/',
          children: [
            RouteConfig(
              DishesViewScreenRoute.name,
              path: 'dishes-view-screen',
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
    required bool hasInternet,
  }) : super(
          DishDescriptionPageRoute.name,
          path: '/dish-description-page',
          args: DishDescriptionPageRouteArgs(
            key: key,
            model: model,
            hasInternet: hasInternet,
          ),
        );

  static const String name = 'DishDescriptionPageRoute';
}

class DishDescriptionPageRouteArgs {
  const DishDescriptionPageRouteArgs({
    this.key,
    required this.model,
    required this.hasInternet,
  });

  final Key? key;

  final DishModel model;

  final bool hasInternet;

  @override
  String toString() {
    return 'DishDescriptionPageRouteArgs{key: $key, model: $model, hasInternet: $hasInternet}';
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

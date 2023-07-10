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
    NavigationPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NavigationPage(),
      );
    },
    DishDescriptionPageRoute.name: (routeData) {
      final args = routeData.argsAs<DishDescriptionPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DishDescriptionPage(
          key: args.key,
          model: args.model,
        ),
      );
    },
    DishesViewPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DishesViewPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          NavigationPageRoute.name,
          path: '/',
          children: [
            RouteConfig(
              DishesViewPageRoute.name,
              path: '',
              parent: NavigationPageRoute.name,
            )
          ],
        ),
        RouteConfig(
          DishDescriptionPageRoute.name,
          path: '/dish-description-page',
        ),
      ];
}

/// generated route for
/// [NavigationPage]
class NavigationPageRoute extends PageRouteInfo<void> {
  const NavigationPageRoute({List<PageRouteInfo>? children})
      : super(
          NavigationPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'NavigationPageRoute';
}

/// generated route for
/// [DishDescriptionPage]
class DishDescriptionPageRoute
    extends PageRouteInfo<DishDescriptionPageRouteArgs> {
  DishDescriptionPageRoute({
    required DishModel model,
    Key? key,
  }) : super(
          DishDescriptionPageRoute.name,
          path: '/dish-description-page',
          args: DishDescriptionPageRouteArgs(
            model: model,
            key: key,
          ),
        );

  static const String name = 'DishDescriptionPageRoute';
}

class DishDescriptionPageRouteArgs {
  const DishDescriptionPageRouteArgs({
    required this.model,
    this.key,
  });

  final DishModel model;

  final Key? key;

  @override
  String toString() {
    return 'DishDescriptionPageRouteArgs{model: $model, key: $key}';
  }
}

/// generated route for
/// [DishesViewPage]
class DishesViewPageRoute extends PageRouteInfo<void> {
  const DishesViewPageRoute()
      : super(
          DishesViewPageRoute.name,
          path: '',
        );

  static const String name = 'DishesViewPageRoute';
}

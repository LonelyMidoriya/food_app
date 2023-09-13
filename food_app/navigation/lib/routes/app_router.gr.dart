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
    StartingPageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const StartingPage(),
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
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
    SuperAdminHomePageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SuperAdminHomePage(),
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminHomePageRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AdminHomePage(),
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
          dish: args.dish,
        ),
        transitionsBuilder: TransitionsBuilders.slideTop,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminDishDescriptionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminDishDescriptionPageRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: AdminDishDescriptionPage(
          key: args.key,
          dish: args.dish,
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
    AdminDishesViewScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AdminDishesViewScreen(),
      );
    },
    AdminOrdersViewScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AdminOrdersViewScreen(),
      );
    },
    AdminControlPanelScreenRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const AdminControlPanelScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          StartingPageRoute.name,
          path: '/',
        ),
        RouteConfig(
          SignupScreenRoute.name,
          path: '/signup-screen',
        ),
        RouteConfig(
          LoginScreenRoute.name,
          path: '/login-screen',
        ),
        RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
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
          SuperAdminHomePageRoute.name,
          path: '/super-admin-home-page',
          children: [
            RouteConfig(
              AdminDishesViewScreenRoute.name,
              path: 'admin-dishes-view-screen',
              parent: SuperAdminHomePageRoute.name,
            ),
            RouteConfig(
              AdminOrdersViewScreenRoute.name,
              path: 'admin-orders-view-screen',
              parent: SuperAdminHomePageRoute.name,
            ),
            RouteConfig(
              AdminControlPanelScreenRoute.name,
              path: 'admin-control-panel-screen',
              parent: SuperAdminHomePageRoute.name,
            ),
            RouteConfig(
              SettingsViewScreenRoute.name,
              path: 'settings-view-screen',
              parent: SuperAdminHomePageRoute.name,
            ),
          ],
        ),
        RouteConfig(
          AdminHomePageRoute.name,
          path: '/admin-home-page',
          children: [
            RouteConfig(
              AdminDishesViewScreenRoute.name,
              path: 'admin-dishes-view-screen',
              parent: AdminHomePageRoute.name,
            ),
            RouteConfig(
              AdminOrdersViewScreenRoute.name,
              path: 'admin-orders-view-screen',
              parent: AdminHomePageRoute.name,
            ),
            RouteConfig(
              SettingsViewScreenRoute.name,
              path: 'settings-view-screen',
              parent: AdminHomePageRoute.name,
            ),
          ],
        ),
        RouteConfig(
          DishDescriptionPageRoute.name,
          path: '/dish-description-page',
        ),
        RouteConfig(
          AdminDishDescriptionPageRoute.name,
          path: '/admin-dish-description-page',
        ),
      ];
}

/// generated route for
/// [StartingPage]
class StartingPageRoute extends PageRouteInfo<void> {
  const StartingPageRoute()
      : super(
          StartingPageRoute.name,
          path: '/',
        );

  static const String name = 'StartingPageRoute';
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
          path: '/login-screen',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          path: '/home-page',
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [SuperAdminHomePage]
class SuperAdminHomePageRoute extends PageRouteInfo<void> {
  const SuperAdminHomePageRoute({List<PageRouteInfo>? children})
      : super(
          SuperAdminHomePageRoute.name,
          path: '/super-admin-home-page',
          initialChildren: children,
        );

  static const String name = 'SuperAdminHomePageRoute';
}

/// generated route for
/// [AdminHomePage]
class AdminHomePageRoute extends PageRouteInfo<void> {
  const AdminHomePageRoute({List<PageRouteInfo>? children})
      : super(
          AdminHomePageRoute.name,
          path: '/admin-home-page',
          initialChildren: children,
        );

  static const String name = 'AdminHomePageRoute';
}

/// generated route for
/// [DishDescriptionPage]
class DishDescriptionPageRoute
    extends PageRouteInfo<DishDescriptionPageRouteArgs> {
  DishDescriptionPageRoute({
    Key? key,
    required DishModel dish,
  }) : super(
          DishDescriptionPageRoute.name,
          path: '/dish-description-page',
          args: DishDescriptionPageRouteArgs(
            key: key,
            dish: dish,
          ),
        );

  static const String name = 'DishDescriptionPageRoute';
}

class DishDescriptionPageRouteArgs {
  const DishDescriptionPageRouteArgs({
    this.key,
    required this.dish,
  });

  final Key? key;

  final DishModel dish;

  @override
  String toString() {
    return 'DishDescriptionPageRouteArgs{key: $key, dish: $dish}';
  }
}

/// generated route for
/// [AdminDishDescriptionPage]
class AdminDishDescriptionPageRoute
    extends PageRouteInfo<AdminDishDescriptionPageRouteArgs> {
  AdminDishDescriptionPageRoute({
    Key? key,
    required DishModel dish,
  }) : super(
          AdminDishDescriptionPageRoute.name,
          path: '/admin-dish-description-page',
          args: AdminDishDescriptionPageRouteArgs(
            key: key,
            dish: dish,
          ),
        );

  static const String name = 'AdminDishDescriptionPageRoute';
}

class AdminDishDescriptionPageRouteArgs {
  const AdminDishDescriptionPageRouteArgs({
    this.key,
    required this.dish,
  });

  final Key? key;

  final DishModel dish;

  @override
  String toString() {
    return 'AdminDishDescriptionPageRouteArgs{key: $key, dish: $dish}';
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

/// generated route for
/// [AdminDishesViewScreen]
class AdminDishesViewScreenRoute extends PageRouteInfo<void> {
  const AdminDishesViewScreenRoute()
      : super(
          AdminDishesViewScreenRoute.name,
          path: 'admin-dishes-view-screen',
        );

  static const String name = 'AdminDishesViewScreenRoute';
}

/// generated route for
/// [AdminOrdersViewScreen]
class AdminOrdersViewScreenRoute extends PageRouteInfo<void> {
  const AdminOrdersViewScreenRoute()
      : super(
          AdminOrdersViewScreenRoute.name,
          path: 'admin-orders-view-screen',
        );

  static const String name = 'AdminOrdersViewScreenRoute';
}

/// generated route for
/// [AdminControlPanelScreen]
class AdminControlPanelScreenRoute extends PageRouteInfo<void> {
  const AdminControlPanelScreenRoute()
      : super(
          AdminControlPanelScreenRoute.name,
          path: 'admin-control-panel-screen',
        );

  static const String name = 'AdminControlPanelScreenRoute';
}

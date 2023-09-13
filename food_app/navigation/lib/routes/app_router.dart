import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/ui/starting_page.dart';
import 'package:navigation/ui/super_admin_home_page.dart';

import '../ui/admin_home_page.dart';
import '../ui/home_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(
      page: StartingPage,
      initial: true,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: SignupScreen,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: LoginScreen,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: HomePage,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
      children: [
        AutoRoute(
          page: DishesViewScreen,
        ),
        AutoRoute(
          page: OrdersViewScreen,
        ),
        AutoRoute(
          page: CartViewScreen,
        ),
        AutoRoute(
          page: SettingsViewScreen,
        ),
      ],
    ),
    CustomRoute(
      page: SuperAdminHomePage,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
      children: [
        AutoRoute(
          page: AdminDishesViewScreen,
        ),
        AutoRoute(
          page: AdminOrdersViewScreen,
        ),
        AutoRoute(
          page: AdminControlPanelScreen,
        ),
        AutoRoute(
          page: SettingsViewScreen,
        ),
      ],
    ),
    CustomRoute(
      page: AdminHomePage,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
      children: [
        AutoRoute(
          page: AdminDishesViewScreen,
        ),
        AutoRoute(
          page: AdminOrdersViewScreen,
        ),
        AutoRoute(
          page: SettingsViewScreen,
        ),
      ],
    ),
    CustomRoute(
      page: DishDescriptionPage,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: AdminDishDescriptionPage,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

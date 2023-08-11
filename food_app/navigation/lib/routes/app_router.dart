import 'package:auth_view/auth_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cart_view/cart_view.dart';
import 'package:dishes_view/dishes_view.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:order_history_view/order_history_view.dart';
import 'package:settings_view/settings_view.dart';

import '../ui/navigation_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(
      page: SignupScreen,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      page: LoginScreen,
      initial: true,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      path: '/',
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
      page: DishDescriptionPage,
      transitionsBuilder: TransitionsBuilders.slideTop,
      durationInMilliseconds: 300,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

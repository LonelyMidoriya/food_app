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
    AutoRoute(
      page: SignupScreen,
    ),
    AutoRoute(
      page: LoginScreen,
      initial: true,
    ),
    AutoRoute(
      path: '/',
      page: HomePage,
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
    AutoRoute(
      page: DishDescriptionPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

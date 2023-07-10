import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dishes_view/dishes_view.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/cupertino.dart';

import '../ui/navigation_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: NavigationPage,
      children: [
        AutoRoute(
          page: DishesViewPage,
          initial: true,
        ),
      ],
    ),
    AutoRoute(
      page: DishDescriptionPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

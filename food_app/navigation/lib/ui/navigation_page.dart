import 'package:auto_route/auto_route.dart';
import 'package:cart_view/cart_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<CartViewBloc, CartViewState>(
            builder: (BuildContext context, CartViewState state) {
              return AutoTabsScaffold(
                homeIndex: 0,
                routes: const [
                  DishesViewScreenRoute(),
                  OrdersViewScreenRoute(),
                  CartViewScreenRoute(),
                  SettingsViewScreenRoute(),
                ],
                bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
                  return BottomNavigationBar(
                    selectedItemColor: theme.colorScheme.tertiary,
                    unselectedItemColor: theme.colorScheme.secondaryContainer,
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex,
                    type: BottomNavigationBarType.shifting,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        backgroundColor: theme.colorScheme.primary,
                        label: 'Home',
                        icon: const Icon(iconHome),
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: theme.colorScheme.primary,
                        label: 'Order history',
                        icon: const Icon(
                          iconHistory,
                        ),
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: theme.colorScheme.primary,
                        label: 'Cart',
                        icon: const Icon(
                          iconCart,
                        ),
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: theme.colorScheme.primary,
                        label: 'Settings',
                        icon: const Icon(
                          iconSettings,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

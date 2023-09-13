import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

class SuperAdminHomePage extends StatelessWidget {
  const SuperAdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: AutoTabsScaffold(
            homeIndex: 0,
            animationCurve: Curves.easeInOutCubic,
            animationDuration: const Duration(milliseconds: 300),
            routes: const [
              AdminDishesViewScreenRoute(),
              AdminOrdersViewScreenRoute(),
              AdminControlPanelScreenRoute(),
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
                    label: 'Admin panel',
                    icon: const Icon(
                      Icons.admin_panel_settings_outlined,
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
          ),
        ),
      ),
    );
  }
}

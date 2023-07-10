import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: AutoTabsScaffold(
          routes: const [
            DishesViewPageRoute(),
            DishesViewPageRoute(),
            DishesViewPageRoute(),
            DishesViewPageRoute(),
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
                  icon: const Icon(
                    IconData(
                      0xe318,
                      fontFamily: 'MaterialIcons',
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  backgroundColor: theme.colorScheme.primary,
                  label: 'Order history',
                  icon: const Icon(
                    IconData(
                      0xe314,
                      fontFamily: 'MaterialIcons',
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  backgroundColor: theme.colorScheme.primary,
                  label: 'Cart',
                  icon: const Icon(
                    IconData(
                      0xe59c,
                      fontFamily: 'MaterialIcons',
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  backgroundColor: theme.colorScheme.primary,
                  label: 'Settings',
                  icon: const Icon(
                    IconData(
                      0xe57f,
                      fontFamily: 'MaterialIcons',
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

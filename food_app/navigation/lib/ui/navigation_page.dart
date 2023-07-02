import 'package:dishes_view/dishes_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(8),
          child: TabBar(
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
            ),
            tabs: const [
              Tab(
                icon: Icon(
                  IconData(0xe318, fontFamily: 'MaterialIcons'),
                ),
              ),
              Tab(
                icon: Icon(
                  IconData(0xe314, fontFamily: 'MaterialIcons'),
                ),
              ),
              Tab(
                icon: Icon(
                  IconData(0xe59c, fontFamily: 'MaterialIcons'),
                ),
              ),
              Tab(
                icon: Icon(
                  IconData(0xe57f, fontFamily: 'MaterialIcons'),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DishesViewPage(),
            Center(
              child: Icon(
                IconData(0xe314, fontFamily: 'MaterialIcons'),
              ),
            ),
            Center(
              child: Icon(
                IconData(0xe59c, fontFamily: 'MaterialIcons'),
              ),
            ),
            Center(
              child: Icon(
                IconData(0xe57f, fontFamily: 'MaterialIcons'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

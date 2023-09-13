import 'package:core/core.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

import '../widget/delete_dish_dialog.dart';
import '../widget/dish_description.dart';
import '../widget/edit_dish_dialog.dart';

class AdminDishDescriptionPage extends StatelessWidget {
  final DishModel _dish;

  const AdminDishDescriptionPage({
    super.key,
    required DishModel dish,
  }) : _dish = dish;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              onPressed: () {
                showAnimatedDialog(
                  animationType: DialogTransitionType.fadeScale,
                  duration: const Duration(milliseconds: 500),
                  context: context,
                  builder: (BuildContext context) {
                    return EditDishDialog(dish: _dish);
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                showAnimatedDialog(
                  animationType: DialogTransitionType.fadeScale,
                  duration: const Duration(milliseconds: 500),
                  context: context,
                  builder: (BuildContext context) {
                    return DeleteDishDialog(dish: _dish);
                  },
                );
              },
              icon: const Icon(Icons.delete_forever),
            ),
          ],
        ),
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          centerTitle: true,
          title: const Text('Description'),
        ),
        body: DishDescription(dish: _dish),
      ),
    );
  }
}

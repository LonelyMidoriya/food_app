import 'package:core_ui/widgets/add_to_cart_button.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

import '../widget/dish_description.dart';

class DishDescriptionPage extends StatelessWidget {
  final DishModel _dish;

  const DishDescriptionPage({
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
          children: [
            AddToCartButton(
              dish: _dish,
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

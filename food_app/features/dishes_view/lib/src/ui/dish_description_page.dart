import 'package:core_ui/widgets/dish_description.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/dish_grid_text.dart';

class DishDescriptionPage extends StatelessWidget {
  final DishModel model;
  const DishDescriptionPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              theme.colorScheme.primary,
            ),
          ),
          child: const GridText(
            text: 'Add to cart',
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: theme.colorScheme.background,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          centerTitle: true,
          title: const Text('Description'),
        ),
        body: DishDescription(model),
      ),
    );
  }
}

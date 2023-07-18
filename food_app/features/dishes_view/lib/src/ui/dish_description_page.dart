import 'package:core_ui/widgets/add_to_cart_button.dart';
import 'package:core_ui/widgets/dish_description.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        floatingActionButton: AddToCartButton(
          name: model.name,
          alignment: MainAxisAlignment.end,
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

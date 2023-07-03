import 'package:core_ui/widgets/dish_description.dart';
import 'package:core_ui/widgets/grid_text.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DishDescriptionPage extends StatelessWidget {
  final DishModel model;
  const DishDescriptionPage(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          child: const GridText(
            text: 'Add to cart',
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: const Text('Description'),
        ),
        body: DishDescription(model),
      ),
    );
  }
}

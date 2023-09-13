import 'package:core/core.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:dishes_view/src/widget/delete_dish_dialog.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

import 'edit_dish_dialog.dart';

class AdminDishGridItem extends StatelessWidget {
  final DishModel _dish;

  const AdminDishGridItem({
    super.key,
    required DishModel dish,
  }) : _dish = dish;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurStyle: BlurStyle.normal,
              color: theme.colorScheme.secondaryContainer,
              blurRadius: 20.0,
              spreadRadius: 1.0,
              offset: const Offset(
                2.0,
                2.0,
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: _dish.imageUrl,
              placeholder: (_, __) => const AppLoaderCenterWidget(),
              errorWidget: (_, __, ___) => const Center(
                child: Text('Error'),
              ),
            ),
            CustomText(
              text: _dish.name,
              fontWeight: FontWeight.w800,
            ),
            CustomText(
              text: '${_dish.cost}\$',
              fontWeight: FontWeight.w500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          ],
        ),
      ),
    );
  }
}

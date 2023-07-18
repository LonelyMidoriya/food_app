import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_ui/widgets/add_to_cart_button.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:domain/model/cart_item_model.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

class CartListViewItem extends StatelessWidget {
  final CartItemModel itemModel;

  const CartListViewItem({
    Key? key,
    required this.itemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurStyle: BlurStyle.normal,
            color: theme.colorScheme.secondaryContainer,
            blurRadius: 30.0,
            spreadRadius: 1.0,
            offset: const Offset(
              2.0,
              2.0,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CachedNetworkImage(
            width: 150,
            height: 150,
            imageUrl: itemModel.imageUrl,
            placeholder: (_, __) => const AppLoaderCenterWidget(),
            errorWidget: (_, __, ___) => const Center(
              child: Text('Error'),
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                itemModel.name,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${itemModel.count} * ${itemModel.cost} = ${double.parse(
                  (itemModel.count * itemModel.cost).toStringAsFixed(2),
                )}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              AddToCartButton(
                model: DishModel(
                  name: itemModel.name,
                  imageUrl: itemModel.imageUrl,
                  cost: itemModel.cost,
                  type: itemModel.type,
                  description: itemModel.description,
                ),
                alignment: MainAxisAlignment.center,
              )
            ],
          ),
        ],
      ),
    );
  }
}

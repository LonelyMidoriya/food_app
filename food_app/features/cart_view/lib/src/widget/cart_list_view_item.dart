import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/model/cart_item_model.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

class CartListViewItem extends StatelessWidget {
  final CartItemModel _itemModel;
  final double _cost;

  const CartListViewItem({
    Key? key,
    required CartItemModel itemModel,
    required double cost,
  })  : _cost = cost,
        _itemModel = itemModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CachedNetworkImage(
            width: 150,
            height: 150,
            imageUrl: _itemModel.imageUrl,
            placeholder: (_, __) => const AppLoaderCenterWidget(),
            errorWidget: (_, __, ___) => const Center(
              child: Text('Error'),
            ),
          ),
          Column(
            children: <Widget>[
              CustomText(
                text: _itemModel.name,
                fontWeight: FontWeight.w800,
              ),
              const SizedBox(
                height: 7,
              ),
              CustomText(
                text:
                    '${_itemModel.count} * ${_itemModel.cost} = ${double.parse(
                  _cost.toStringAsFixed(2),
                )}',
                fontWeight: FontWeight.w500,
              ),
              AddToCartButton(
                model: DishModel(
                  name: _itemModel.name,
                  imageUrl: _itemModel.imageUrl,
                  cost: _itemModel.cost,
                  type: _itemModel.type,
                  description: _itemModel.description,
                  stats: {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

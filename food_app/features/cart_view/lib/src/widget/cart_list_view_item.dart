import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/model/cart_item_model.dart';
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
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.colorScheme.onTertiary.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              //height: size.height / 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            width: size.width / 3,
            height: size.width / 4,
            imageUrl: _itemModel.dish.imageUrl,
            placeholder: (_, __) => const AppLoaderCenterWidget(),
            errorWidget: (_, __, ___) => const Center(
              child: Text('Error'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                child: CustomText(
                  text: _itemModel.dish.name,
                  fontWeight: FontWeight.w800,
                  maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              SizedBox(
                width: size.width / 2,
                child: CustomText(
                  text: '${_itemModel.count} * ${_itemModel.dish.cost}\$ = '
                      '${_cost.toStringAsFixed(2)}\$',
                  fontWeight: FontWeight.w500,
                ),
              ),
              AddToCartButton(
                dish: _itemModel.dish,
              )
            ],
          ),
        ],
      ),
    );
  }
}

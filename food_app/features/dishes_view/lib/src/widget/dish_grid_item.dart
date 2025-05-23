import 'package:core/core.dart';
import 'package:core_ui/widgets/add_to_cart_button.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

class DishGridItem extends StatelessWidget {
  final DishModel _dish;

  const DishGridItem({
    super.key,
    required DishModel dish,
  }) : _dish = dish;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.onTertiary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     blurStyle: BlurStyle.normal,
          //     color: theme.colorScheme.secondaryContainer,
          //     blurRadius: 10.0,
          //     spreadRadius: 1.0,
          //     offset: const Offset(
          //       2.0,
          //       2.0,
          //     ),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: _dish.imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                height: size.height / 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
            AddToCartButton(
              dish: _dish,
            ),
          ],
        ),
      ),
    );
  }
}

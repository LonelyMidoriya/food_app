import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_ui/widgets/grid_text.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

import 'app_loader_center_widget.dart';

class GridItem extends StatelessWidget {
  final DishModel dish;
  const GridItem(this.dish, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.normal,
              color: Theme.of(context).colorScheme.secondaryContainer,
              blurRadius: 30.0,
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
              imageUrl: dish.imageUrl,
              placeholder: (_, __) => const AppLoaderCenterWidget(),
              errorWidget: (_, __, ___) => const Center(
                child: Text('Error'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GridText(
              text: dish.name,
              fontWeight: FontWeight.w800,
            ),
            GridText(
              text: '${dish.cost}\$',
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: const GridText(
                text: 'Add to cart',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

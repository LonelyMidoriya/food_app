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
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
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
                    Colors.deepOrange[300],
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
                )),
          ],
        ),
      ),
    );
  }
}

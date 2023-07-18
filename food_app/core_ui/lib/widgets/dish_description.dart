import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

import 'app_loader_center_widget.dart';

class DishDescription extends StatelessWidget {
  final DishModel model;
  const DishDescription(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: double.infinity,
      color: theme.colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: model.imageUrl,
                width: 200,
                height: 200,
                placeholder: (_, __) => const AppLoaderCenterWidget(),
                errorWidget: (_, __, ___) => const Center(
                  child: Text('Error'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
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
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        model.name,
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        '${model.cost}\$',
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: Text(
                        model.description,
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

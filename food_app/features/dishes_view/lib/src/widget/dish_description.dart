import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';

class DishDescription extends StatelessWidget {
  final DishModel _dish;

  const DishDescription({
    required DishModel dish,
    super.key,
  }) : _dish = dish;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);

    return Container(
      height: double.infinity,
      color: theme.colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: _dish.imageUrl,
                width: size.width / 2,
                height: size.width / 2,
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
                  boxShadow: <BoxShadow>[
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
                      child: CustomText(
                        text: _dish.name,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: CustomText(
                        text: '${_dish.cost}\$',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Center(
                      child: CustomText(
                        text: _dish.description,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Column(
                      children: _dish.stats.entries.map(
                        (MapEntry<dynamic, dynamic> entry) {
                          if (entry.key == 'kcal') {
                            return CustomProgressIndicator(
                              end: entry.value / 1000,
                              stat: getStatShortForm(entry.key),
                              statValue: entry.value,
                            );
                          }
                          return CustomProgressIndicator(
                            end: entry.value / 100,
                            stat: getStatShortForm(entry.key),
                            statValue: entry.value,
                          );
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getStatShortForm(String stat) {
    if (stat == 'carbohydrates') {
      return 'CHO';
    } else if (stat == 'fats') {
      return 'Fats';
    } else if (stat == 'proteins') {
      return 'PRT';
    } else if (stat == 'kcal') {
      return 'KCal';
    } else {
      return 'Error';
    }
  }
}

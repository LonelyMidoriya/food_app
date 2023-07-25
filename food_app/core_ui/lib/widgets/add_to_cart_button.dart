import 'package:cart_view/cart_view.dart';
import 'package:core/core.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:settings_view/settings_view.dart';

class AddToCartButton extends StatelessWidget {
  final DishModel model;
  final MainAxisAlignment alignment;
  final bool hasInternet;

  const AddToCartButton({
    Key? key,
    required this.model,
    required this.alignment,
    required this.hasInternet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedTheme(
      data: theme,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: BlocBuilder<SettingsViewBloc, SettingsViewState>(
          builder: (BuildContext context, SettingsViewState settingsState) {
        return BlocBuilder<CartViewBloc, CartViewState>(
          builder: (BuildContext context, CartViewState state) {
            if (state.hasInternet && hasInternet) {
              if (state.cart.cartItems
                  .where((element) => element.name == model.name)
                  .isNotEmpty) {
                return Row(
                  mainAxisAlignment: alignment,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CartViewBloc>(context).add(
                          DeleteFromCartEvent(
                            dishModel: model,
                            count: state.cart.cartItems
                                    .where(
                                        (element) => element.name == model.name)
                                    .first
                                    .count - 1,
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          theme.colorScheme.primary,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: Icon(
                        const IconData(
                          0xe24b,
                          fontFamily: 'MaterialIcons',
                        ),
                        size: settingsState.fontSize + 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 6,
                      ),
                      child: Text(
                        '${state.cart.cartItems.where((element) => element.name == model.name).first.count}',
                        style: TextStyle(
                          fontSize: settingsState.fontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CartViewBloc>(context).add(
                          AddToCartEvent(
                              dishModel: model,
                              count: state.cart.cartItems
                                      .where((element) =>
                                          element.name == model.name)
                                      .first
                                      .count + 1),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          theme.colorScheme.primary,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: Icon(
                        const IconData(
                          0xe4d6,
                          fontFamily: 'MaterialIcons',
                        ),
                        size: settingsState.fontSize + 2,
                      ),
                    ),
                  ],
                );
              } else {
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartViewBloc>(context).add(
                      AddToCartEvent(
                        dishModel: model,
                        count: 1,
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      theme.colorScheme.primary,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: settingsState.fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }
            } else {
              return const SizedBox();
            }
          },
        );
      }),
    );
  }
}

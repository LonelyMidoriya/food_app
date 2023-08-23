import 'package:cart_view/cart_view.dart';
import 'package:core/core.dart';
import 'package:domain/model/cart_item_model.dart';
import 'package:domain/model/dish_model.dart';
import 'package:flutter/material.dart';
import 'package:settings_view/settings_view.dart';

class AddToCartButton extends StatelessWidget {
  final DishModel _dish;

  const AddToCartButton({
    Key? key,
    required DishModel dish,
  })  : _dish = dish,
        super(key: key);

  Iterable<CartItemModel> _findCartItem(CartViewState state) {
    return state.cart.cartItems.where(
      (element) => element.dish.name == _dish.name,
    );
  }

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
              if (state.hasInternet) {
                if (_findCartItem(state).isNotEmpty) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<CartViewBloc>(context).add(
                            DeleteFromCartEvent(
                              dishModel: _dish,
                              count: _findCartItem(state).first.count - 1,
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            theme.colorScheme.primary,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            theme.colorScheme.tertiary,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: Icon(
                          iconMinusOne,
                          size: settingsState.fontSize + 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 6,
                        ),
                        child: Text(
                          '${_findCartItem(state).first.count}',
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
                              dishModel: _dish,
                              count: _findCartItem(state).first.count + 1,
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            theme.colorScheme.primary,
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            theme.colorScheme.tertiary,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        child: Icon(
                          iconPlusOne,
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
                          dishModel: _dish,
                          count: 1,
                        ),
                      );
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                        theme.colorScheme.tertiary,
                      ),
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
        },
      ),
    );
  }
}

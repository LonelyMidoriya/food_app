import 'package:cart_view/src/widget/cart_list_view_item.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets/app_button_widget.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:domain/model/cart_item_model.dart';
import 'package:flutter/material.dart';

import '../bloc/bloc.dart';

class CartViewScreen extends StatelessWidget {
  const CartViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedTheme(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      data: theme,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: theme.colorScheme.background,
            title: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  theme.colorScheme.primary,
                ),
              ),
              onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(),
              child: const Icon(
                Icons.dark_mode_outlined,
              ),
            ),
          ),
          backgroundColor: theme.colorScheme.background,
          body: BlocBuilder<CartViewBloc, CartViewState>(
            builder: (BuildContext context, CartViewState state) {
              if (!state.isError && !state.isLoaded) {
                return const AppLoaderCenterWidget();
              } else if (state.isError) {
                return Center(
                  child: Text(state.errorMessage.toString()),
                );
              } else if (state.isLoaded) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total:',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Text(
                            '${double.parse(
                              (state.cost).toStringAsFixed(2),
                            )}\$',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 3,
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(10),
                        key: const PageStorageKey<String>('cart'),
                        addAutomaticKeepAlives: false,
                        addRepaintBoundaries: false,
                        itemCount: state.cart.cartItems.length,
                        itemBuilder: (context, index) {
                          CartItemModel item = state.cart.cartItems[index];
                          return CartListViewItem(
                            itemModel: item,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: AppButtonWidget(
                    label: 'load'.trim(),
                    onTap: () {
                      BlocProvider.of<CartViewBloc>(context).add(
                        InitCartEvent(),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

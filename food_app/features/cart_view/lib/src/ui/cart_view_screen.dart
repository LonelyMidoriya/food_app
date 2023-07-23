import 'package:cart_view/src/widget/cart_list_view_item.dart';
import 'package:core/core.dart';
import 'package:core_ui/widgets/app_button_widget.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:dishes_view/dishes_view.dart';
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
          backgroundColor: theme.colorScheme.background,
          body: BlocConsumer<CartViewBloc, CartViewState>(
            listener: (BuildContext context, CartViewState state) {
              if (!state.hasInternet) {
                BlocProvider.of<DishesViewBloc>(context).add(
                  CheckInternetDishesEvent(),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    elevation: 50,
                    backgroundColor: Colors.teal,
                    content: CustomText(
                      text: 'No Internet connection!',
                      fontWeight: FontWeight.w800,
                    ),
                    duration: Duration(seconds: 2),
                    margin: EdgeInsets.symmetric(
                      vertical: 60,
                      horizontal: 30,
                    ),
                  ),
                );
              }
            },
            builder: (BuildContext context, CartViewState state) {
              if (!state.isError && !state.isLoaded && state.hasInternet) {
                return const AppLoaderCenterWidget();
              } else if (state.isError && state.hasInternet) {
                return Center(
                  child: Text(state.errorMessage.toString()),
                );
              } else if (state.isLoaded && state.hasInternet) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const CustomText(
                            text: 'Total:',
                            fontWeight: FontWeight.w800,
                          ),
                          CustomText(
                            text: '${double.parse(
                              (state.cost).toStringAsFixed(2),
                            )}\$',
                            fontWeight: FontWeight.w800,
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
                            hasInternet: state.hasInternet,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: CustomText(
                          text: 'Internet connection lost.',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppButtonWidget(
                        label: 'Refresh'.trim(),
                        onTap: () {
                          BlocProvider.of<CartViewBloc>(context).add(
                            InitCartEvent(),
                          );
                          BlocProvider.of<DishesViewBloc>(context).add(
                            CheckInternetDishesEvent(),
                          );
                        },
                      ),
                    ],
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
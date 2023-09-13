import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

import 'package:flutter/material.dart';

class CartViewScreen extends StatelessWidget {
  const CartViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CartViewBloc cartViewBloc = BlocProvider.of<CartViewBloc>(context);

    return AnimatedTheme(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      data: theme,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: const OrderButton(),
          backgroundColor: theme.colorScheme.background,
          body: BlocConsumer<CartViewBloc, CartViewState>(
            listener: (BuildContext context, CartViewState state) {
              if (!state.hasInternet) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    elevation: 50,
                    backgroundColor: Colors.teal,
                    content: CustomText(
                      text: 'No Internet connection!',
                      fontWeight: FontWeight.w800,
                      textColor: theme.colorScheme.tertiary,
                    ),
                    duration: const Duration(seconds: 2),
                    margin: const EdgeInsets.symmetric(
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
                if (state.cart.cartItems.isEmpty) {
                  return const Center(
                    child: CustomText(
                      text: 'Your cart is empty',
                      fontWeight: FontWeight.w900,
                    ),
                  );
                } else {
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
                              text: '${(state.cost).toStringAsFixed(2)}\$',
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
                            if (index == state.cart.cartItems.length - 1) {
                              return Column(
                                children: [
                                  CartListViewItem(
                                    itemModel: state.cart.cartItems[index],
                                    cost: state.cart.cartItems[index].count *
                                        state.cart.cartItems[index].dish.cost,
                                  ),
                                  const SizedBox(
                                    height: 70,
                                  )
                                ],
                              );
                            } else {
                              return CartListViewItem(
                                itemModel: state.cart.cartItems[index],
                                cost: state.cart.cartItems[index].count *
                                    state.cart.cartItems[index].dish.cost,
                              );
                            }
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      ),
                    ],
                  );
                }
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                        label: 'Refresh',
                        onTap: () {
                          cartViewBloc.add(
                            InitCartEvent(),
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

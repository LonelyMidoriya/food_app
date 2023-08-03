import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:order_history_view/order_history_view.dart';

import '../../cart_view.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewBloc, CartViewState>(
      builder: (BuildContext context, CartViewState state) {
        if (!state.hasInternet || state.cart.cartItems.isEmpty) {
          return const SizedBox();
        } else {
          return AppButtonWidget(
            onTap: () async {
              BlocProvider.of<OrdersViewBloc>(context).add(
                AddToOrdersEvent(
                  cartModel: state.cart,
                  cost: state.cost,
                ),
              );
              BlocProvider.of<CartViewBloc>(context).add(
                ClearCartEvent(),
              );
              final bool hasInternet =
                  await appLocator.get<InternetConnection>().hasInternetAccess;
              if (hasInternet) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    elevation: 50,
                    backgroundColor: Colors.teal,
                    content: CustomText(
                      text: 'Your food is ordered!',
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
            label: 'Order',
          );
        }
      },
    );
  }
}

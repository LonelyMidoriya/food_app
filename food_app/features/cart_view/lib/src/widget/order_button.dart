import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartViewBloc cartViewBloc = BlocProvider.of<CartViewBloc>(context);
    final OrdersViewBloc ordersViewBloc = BlocProvider.of<OrdersViewBloc>(context);

    return BlocBuilder<AuthViewBloc, AuthViewState>(
      builder: (BuildContext context, AuthViewState authState) {
        return BlocBuilder<CartViewBloc, CartViewState>(
          builder: (BuildContext context, CartViewState state) {
            if (!state.hasInternet || state.cart.cartItems.isEmpty) {
              return const SizedBox();
            } else {
              return AppButtonWidget(
                onTap: () async {
                  ordersViewBloc.add(
                    AddToOrdersEvent(
                      cartModel: state.cart,
                      cost: state.cost,
                      email: authState.user.email,
                    ),
                  );
                  cartViewBloc.add(
                    ClearCartEvent(),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      elevation: 50,
                      backgroundColor: Colors.teal,
                      content: CustomText(
                        text: 'Your food is ordered!',
                        fontWeight: FontWeight.w800,
                        textColor: Theme.of(context).colorScheme.tertiary,
                      ),
                      duration: const Duration(seconds: 2),
                      margin: const EdgeInsets.symmetric(
                        vertical: 60,
                        horizontal: 30,
                      ),
                    ),
                  );
                },
                label: 'Order',
              );
            }
          },
        );
      }
    );
  }
}

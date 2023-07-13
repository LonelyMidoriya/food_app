import 'package:cart_view/cart_view.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final String name;
  final MainAxisAlignment alignment;
  const AddToCartButton({
    Key? key,
    required this.name,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AnimatedTheme(
      data: theme,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: BlocBuilder<CartViewBloc, CartViewState>(
        builder: (BuildContext context, CartViewState state) {
          if (state.cart.containsKey(name)) {
            return Row(
              mainAxisAlignment: alignment,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartViewBloc>(context).add(
                      DeleteFromCartEvent(
                        name: name,
                        count: state.cart[name] - 1,
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
                  child: const Icon(
                    IconData(
                      0xe24b,
                      fontFamily: 'MaterialIcons',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 6,
                  ),
                  child: Text(
                    '${state.cart[name]}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartViewBloc>(context).add(
                      AddToCartEvent(
                        name: name,
                        count: state.cart[name] + 1,
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
                  child: const Icon(
                    IconData(
                      0xe4d6,
                      fontFamily: 'MaterialIcons',
                    ),
                  ),
                ),
              ],
            );
          } else {
            return ElevatedButton(
              onPressed: () {
                BlocProvider.of<CartViewBloc>(context).add(
                  AddToCartEvent(
                    name: name,
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
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:settings_view/settings_view.dart';

class OrderItem extends StatelessWidget {
  final CartModel cartModel;

  const OrderItem({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');

    return BlocBuilder<SettingsViewBloc, SettingsViewState>(
        builder: (BuildContext context, SettingsViewState state) {
      return Container(
        height: (cartModel.cartItems.length + 2) * state.fontSize * 3,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurStyle: BlurStyle.normal,
              color: theme.colorScheme.secondaryContainer,
              blurRadius: 20.0,
              spreadRadius: 1.0,
              offset: const Offset(
                2.0,
                2.0,
              ),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: '#${cartModel.id}',
                    fontWeight: FontWeight.w900,
                  ),
                  CustomText(
                      text: dateFormat.format(
                        dateFormat.parse(cartModel.date),
                      ),
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
            const Divider(
              thickness: 3,
            ),
            Flexible(
              flex: cartModel.cartItems.length + 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartModel.cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(state.fontSize / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CustomText(
                            text: cartModel.cartItems[index].name,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text: '${cartModel.cartItems[index].count} * '
                                '${cartModel.cartItems[index].cost}\$',
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const Divider(
              thickness: 3,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const CustomText(
                    text: 'Total:',
                    fontWeight: FontWeight.w800,
                  ),
                  CustomText(
                    text: '${(cartModel.cost).toStringAsFixed(2)}\$',
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

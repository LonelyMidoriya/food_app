import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'order_item.dart';

class AdminOrderItem extends StatelessWidget {
  final OrderHistoryModel _orders;
  final String _email;

  const AdminOrderItem({
    Key? key,
    required OrderHistoryModel orders,
    required String email,
  })  : _orders = orders,
        _email = email,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);

    return ExpansionTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: theme.colorScheme.primary,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      collapsedBackgroundColor: theme.colorScheme.primary,
      title: Align(
        alignment: Alignment.center,
        child: CustomText(
          text: _email,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: <Widget>[
        ListTile(
          title: SizedBox(
            height: _orders.carts.length == 1
                ? size.height / 3.5
                : size.height / 2,
            child: Center(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                itemCount: _orders.carts.length,
                itemBuilder: (BuildContext context, int index) {
                  return OrderItem(
                    cartModel: _orders.carts[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

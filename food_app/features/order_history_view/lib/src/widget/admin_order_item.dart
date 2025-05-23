import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:order_history_view/src/widget/edit_order_status_dialog.dart';

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
          maxLines: 1,
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
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                itemCount: _orders.carts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      OrderItem(
                        isAdmin: true,
                        cartModel: _orders.carts[index],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.background,
                        ),
                        onPressed: () {
                          showAnimatedDialog(
                            animationType: DialogTransitionType.fadeScale,
                            duration: const Duration(milliseconds: 500),
                            context: context,
                            builder: (BuildContext context) {
                              return EditOrderStatusDialog(
                                order: _orders.carts[index],
                                email: _email,
                              );
                            },
                          );
                        },
                        child: const CustomText(
                          text: 'Change status',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
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

import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class OrderItem extends StatelessWidget {
  final CartModel _cartModel;
  final bool _isAdmin;

  const OrderItem({Key? key, required CartModel cartModel, required bool isAdmin})
      : _cartModel = cartModel,
        _isAdmin = isAdmin,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
    final Size size = MediaQuery.sizeOf(context);

    return BlocBuilder<SettingsViewBloc, SettingsViewState>(
      builder: (BuildContext context, SettingsViewState state) {
        return Container(
          height: (_cartModel.cartItems.length + 3) * state.fontSize * 3,
          decoration: BoxDecoration(
            color: _isAdmin ? theme.colorScheme.primaryContainer.withOpacity(0.6) : theme.colorScheme.onTertiary.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 15,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomText(
                        text: '#${_cartModel.id}',
                        fontWeight: FontWeight.w900,
                      ),
                      CustomText(
                          text: dateFormat.format(
                            dateFormat.parse(_cartModel.date),
                          ),
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Flexible(
                flex: _cartModel.cartItems.length == 1
                    ? _cartModel.cartItems.length
                    : _cartModel.cartItems.length + 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _cartModel.cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: _cartModel.cartItems.length == 1
                              ? state.fontSize / 2
                              : state.fontSize / 2 + 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: size.width / 2,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CustomText(
                                  text: _cartModel.cartItems[index].dish.name,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 4,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CustomText(
                                  text:
                                      '${_cartModel.cartItems[index].count} * '
                                      '${_cartModel.cartItems[index].dish.cost}\$',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const CustomText(
                        text: 'Total:',
                        fontWeight: FontWeight.w800,
                      ),
                      CustomText(
                        text: '${(_cartModel.cost).toStringAsFixed(2)}\$',
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 3,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    bottom: 15,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const CustomText(
                        text: 'Status:',
                        fontWeight: FontWeight.w800,
                      ),
                      CustomText(
                        text: _cartModel.status,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class EditOrderStatusDialog extends StatefulWidget {
  final CartModel _order;
  final String _email;
  const EditOrderStatusDialog({
    Key? key,
    required CartModel order,
    required String email,
  })  : _order = order,
        _email = email,
        super(key: key);

  @override
  State<EditOrderStatusDialog> createState() => _EditOrderStatusDialogState();
}

class _EditOrderStatusDialogState extends State<EditOrderStatusDialog> {
  final TextEditingController dropDownController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dropDownController.text = widget._order.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final OrdersViewBloc ordersViewBloc =
    BlocProvider.of<OrdersViewBloc>(context);
    final AuthViewBloc authViewBloc = BlocProvider.of<AuthViewBloc>(context);
    return AlertDialog(
      insetPadding: EdgeInsets.only(
        top: size.height / 20,
        bottom: size.height / 20,
        right: size.width / 20,
        left: size.width / 20,
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: SizedBox(
        height: size.height / 30,
        width: size.width / 1.5,
        child: const CustomText(
          text: 'Edit order status',
          fontWeight: FontWeight.w900,
        ),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                DropdownButtonFormField(
                  value: dropDownController.text,
                  items: OrderStatus.values
                      .where((element) => element.name != 'all')
                      .toList()
                      .map<DropdownMenuItem<String>>(
                        (OrderStatus e) {
                      return DropdownMenuItem<String>(
                        value: e.name,
                        child: Center(
                          child: SizedBox(
                            height: size.height / 15,
                            width: size.width / 2,
                            child: Center(
                              child: CustomText(
                                text: e.name,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (String? newValue) {
                    dropDownController.text = newValue!;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: size.width / 3,
          height: size.height / 15,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                ordersViewBloc.add(
                  UpdateOrderStatusEvent(
                      cartModel: widget._order,
                      status: dropDownController.text,
                      email: widget._email,
                  )
                );
                authViewBloc.add(
                  PopToPreviousPageEvent(),
                );
              }
            },
            child: const CustomText(
              text: 'Save',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: size.width / 3,
          height: size.height / 15,
          child: ElevatedButton(
            onPressed: () => authViewBloc.add(
              PopToPreviousPageEvent(),
            ),
            child: const CustomText(
              text: 'Cancel',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

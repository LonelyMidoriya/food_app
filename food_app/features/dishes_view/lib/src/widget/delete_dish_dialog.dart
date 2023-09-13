import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

class DeleteDishDialog extends StatelessWidget {
  final DishModel _dish;
  const DeleteDishDialog({
    Key? key,
    required DishModel dish,
  })  : _dish = dish,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final DishesViewBloc dishesViewBloc =
        BlocProvider.of<DishesViewBloc>(context);
    final AuthViewBloc authViewBloc = BlocProvider.of<AuthViewBloc>(context);

    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: SizedBox(
        height: size.height / 15,
        width: size.width / 1.5,
        child: const CustomText(
          text: 'Delete dish',
          fontWeight: FontWeight.w900,
        ),
      ),
      content: SizedBox(
        height: size.height / 15,
        width: size.width / 1.5,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: <Widget>[
                CustomText(
                  text: 'Wanna delete dish?',
                  fontWeight: FontWeight.w500,
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
              dishesViewBloc.add(
                DeleteDishEvent(
                  dish: _dish,
                ),
              );
              if (authViewBloc.state.user.isSuperAdmin) {
                authViewBloc.add(
                  const PopUntilPageEvent(
                    route: SuperAdminHomePageRoute.name,
                  ),
                );
              } else {
                authViewBloc.add(
                  const PopUntilPageEvent(
                    route: AdminHomePageRoute.name,
                  ),
                );
              }
            },
            child: const CustomText(
              text: 'Yes',
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
              text: 'No',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

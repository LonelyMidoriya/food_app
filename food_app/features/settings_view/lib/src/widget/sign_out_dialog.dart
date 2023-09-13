import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final AuthViewBloc authViewBloc = BlocProvider.of<AuthViewBloc>(context);

    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: SizedBox(
        height: size.height / 15,
        width: size.width / 1.5,
        child: const CustomText(
          text: 'Sign out',
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
                  text: 'Wanna sign out?',
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
              authViewBloc.add(
                UserSignoutEvent(),
              );
              authViewBloc.add(
                const PopUntilPageEvent(
                  route: StartingPageRoute.name,
                ),
              );
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

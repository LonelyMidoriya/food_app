import 'package:core/core.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../auth_view.dart';

class SignUpWithSocials extends StatelessWidget {
  const SignUpWithSocials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: CustomText(
              text: 'Or Sign up with:',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Center(
          child: MaterialButton(
            onPressed: () {
              BlocProvider.of<AuthViewBloc>(context).add(
                UserSignupWithGoogleEvent(),
              );
            },
            child: Image.network(
              googleUrl,
              fit: BoxFit.scaleDown,
              height: size.width / 10,
              width: size.width / 10,
            ),
          ),
        ),
      ],
    );
  }
}

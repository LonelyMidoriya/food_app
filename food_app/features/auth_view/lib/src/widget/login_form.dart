import 'package:core/core.dart';
import 'package:core_ui/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

import '../../auth_view.dart';

class LogInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LogInForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: emailValidator,
            decoration: inputDecoration("Email"),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextFormField(
              obscureText: true,
              controller: passwordController,
              validator: passwordValidator,
              decoration: inputDecoration("Password")),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: InkWell(
            onTap: () {
              BlocProvider.of<AuthViewBloc>(context).add(
                UserLogInEvent(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

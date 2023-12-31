import 'package:core/core.dart';
import 'package:core_ui/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

import '../../auth_view.dart';

class LogInForm extends StatelessWidget {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;

  const LogInForm({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formKey,
  })  : _passwordController = passwordController,
        _formKey = formKey,
        _emailController = emailController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
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
            controller: _passwordController,
            validator: passwordValidator,
            decoration: inputDecoration("Password"),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: InkWell(
            onTap: () {
              if (_formKey.currentState?.validate() == true) {
                BlocProvider.of<AuthViewBloc>(context).add(
                  UserLogInEvent(
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim(),
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
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

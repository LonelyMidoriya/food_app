import 'package:core/core.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:core_ui/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

import '../../auth_view.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> _formKey;

  const SignUpForm({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        _confirmPasswordController = confirmPasswordController,
        _passwordController = passwordController,
        _emailController = emailController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
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
              decoration: inputDecoration("Password")),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextFormField(
            obscureText: true,
            controller: _confirmPasswordController,
            validator: passwordValidator,
            decoration: inputDecoration("Confirm Password"),
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
                if (_passwordController.text.trim() ==
                    _confirmPasswordController.text.trim()) {
                  BlocProvider.of<AuthViewBloc>(context).add(
                    UserSignupWithEmailAndPasswordEvent(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      elevation: 50,
                      backgroundColor: Colors.teal,
                      content: CustomText(
                        text: 'Passwords don\'t match!',
                        fontWeight: FontWeight.w800,
                      ),
                      duration: Duration(seconds: 2),
                      margin: EdgeInsets.symmetric(
                        vertical: 60,
                        horizontal: 30,
                      ),
                    ),
                  );
                }
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
                  "Sign up",
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

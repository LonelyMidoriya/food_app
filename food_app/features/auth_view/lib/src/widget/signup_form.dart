import 'package:core/core.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:core_ui/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

import '../../auth_view.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  const SignUpForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
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
          child: TextFormField(
            obscureText: true,
            controller: confirmPasswordController,
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
              if (formKey.currentState?.validate() == true) {
                if (passwordController.text.trim() ==
                    confirmPasswordController.text.trim()) {
                  BlocProvider.of<AuthViewBloc>(context).add(
                    UserSignupWithEmailAndPasswordEvent(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
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

import 'package:auth_view/auth_view.dart';
import 'package:auth_view/src/widget/login_form.dart';
import 'package:cart_view/cart_view.dart';
import 'package:core/core.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

import '../widget/signup_with.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: BlocConsumer<AuthViewBloc, AuthViewState>(
        listener: (context, state) {
          if (state.isLoggedIn) {
            BlocProvider.of<CartViewBloc>(context).add(
              InitCartEvent(),
            );
            appRouter.navigate(
              const HomePageRoute(),
            );
          }
          if (state.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                elevation: 50,
                backgroundColor: Colors.teal,
                content: CustomText(
                  text: state.errorMessage.toString(),
                  fontWeight: FontWeight.w800,
                ),
                duration: const Duration(seconds: 2),
                margin: const EdgeInsets.symmetric(
                  vertical: 60,
                  horizontal: 30,
                ),
              ),
            );
          } else if (state.isLoaded) {
            BlocProvider.of<CartViewBloc>(context).add(
              InitCartEvent(),
            );
            appRouter.navigate(
              const HomePageRoute(),
            );
          }
        },
        builder: (context, state) {
          return AnimatedTheme(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            data: theme,
            child: Scaffold(
              backgroundColor: theme.colorScheme.background,
              body: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Center(
                              child: CustomText(
                                text: 'Hello Again!',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Center(
                              child: CustomText(
                                text:
                                    'Please enter in your account to use our services.',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          LogInForm(
                            emailController: emailController,
                            passwordController: passwordController,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const SignUpWith(),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don\'t have an account? ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  appRouter.navigate(
                                    const SignupScreenRoute(),
                                  );
                                },
                                child: const Text(
                                  "Sign up Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

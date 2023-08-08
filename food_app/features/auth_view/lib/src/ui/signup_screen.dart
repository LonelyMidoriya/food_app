import 'package:auth_view/auth_view.dart';
import 'package:auth_view/src/widget/signup_form.dart';
import 'package:auth_view/src/widget/signup_with_socials.dart';
import 'package:cart_view/cart_view.dart';
import 'package:core/core.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';
import 'package:order_history_view/order_history_view.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
            BlocProvider.of<OrdersViewBloc>(context).add(
              InitOrdersEvent(),
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
            BlocProvider.of<OrdersViewBloc>(context).add(
              InitOrdersEvent(),
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
                                text: 'Hello!',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: CustomText(
                              text:
                                  'Please create an account to use our services.',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          SignUpForm(
                            emailController: emailController,
                            passwordController: passwordController,
                            confirmPasswordController:
                                confirmPasswordController,
                            formKey: _formKey,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const SignUpWithSocials(),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  appRouter.navigate(
                                    const LoginScreenRoute(),
                                  );
                                },
                                child: const Text(
                                  "Login Now",
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
    confirmPasswordController.dispose();
    super.dispose();
  }
}

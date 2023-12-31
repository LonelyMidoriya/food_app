import 'package:auth_view/src/widget/login_form.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

import '../widget/signup_with_socials.dart';

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
    final AdminControlPanelBloc adminControlPanelBloc =
        BlocProvider.of<AdminControlPanelBloc>(context);
    final OrdersViewBloc ordersViewBloc =
        BlocProvider.of<OrdersViewBloc>(context);
    final CartViewBloc cartViewBloc = BlocProvider.of<CartViewBloc>(context);
    final AuthViewBloc authViewBloc = BlocProvider.of<AuthViewBloc>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: BlocConsumer<AuthViewBloc, AuthViewState>(
        listener: (BuildContext context, AuthViewState state) {
          if (state.isLoggedIn) {
            if (state.user.isAdmin) {
              ordersViewBloc.add(
                InitAdminOrdersEvent(),
              );
              if (state.user.isSuperAdmin) {
                adminControlPanelBloc.add(
                  AdminControlPanelInitEvent(),
                );
                authViewBloc.add(
                  const NavigateToPageEvent(
                    route: SuperAdminHomePageRoute(),
                  ),
                );
              } else {
                authViewBloc.add(
                  const NavigateToPageEvent(
                    route: AdminHomePageRoute(),
                  ),
                );
              }
            } else {
              ordersViewBloc.add(
                InitOrdersEvent(),
              );
              cartViewBloc.add(
                InitCartEvent(),
              );
              authViewBloc.add(
                const NavigateToPageEvent(
                  route: HomePageRoute(),
                ),
              );
            }
          }
          if (state.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                elevation: 50,
                backgroundColor: Colors.teal,
                content: CustomText(
                  text: state.errorMessage.toString().split('] ').last,
                  fontWeight: FontWeight.w800,
                  textColor: theme.colorScheme.tertiary,
                ),
                duration: const Duration(seconds: 2),
                margin: const EdgeInsets.symmetric(
                  vertical: 60,
                  horizontal: 30,
                ),
              ),
            );
          }
        },
        builder: (BuildContext _, AuthViewState state) {
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
                                text: 'Please log in to use our services.',
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
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () => authViewBloc.add(
                                  const NavigateToPageEvent(
                                    route: SignupScreenRoute(),
                                  ),
                                ),
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

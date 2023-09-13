import 'package:auth_view/src/widget/signup_form.dart';
import 'package:auth_view/src/widget/signup_with_socials.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

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
    final AuthViewBloc authViewBloc = BlocProvider.of<AuthViewBloc>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<AuthViewBloc, AuthViewState>(
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
                                onTap: () => authViewBloc.add(
                                  const NavigateToPageEvent(
                                    route: LoginScreenRoute(),
                                  ),
                                ),
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

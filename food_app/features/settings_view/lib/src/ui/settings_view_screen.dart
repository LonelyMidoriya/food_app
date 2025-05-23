import 'package:auth_view/auth_view.dart';
import 'package:core/core.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

import '../../settings_view.dart';

class SettingsViewScreen extends StatelessWidget {
  const SettingsViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AuthViewBloc authViewBloc = BlocProvider.of<AuthViewBloc>(context);

    return AnimatedTheme(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      data: theme,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: theme.colorScheme.primary,
            title: BlocBuilder<AuthViewBloc, AuthViewState>(
              builder: (BuildContext context, AuthViewState state) {
                if (state.isLoggedIn) {
                  return CustomText(
                    text: state.user.email,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                  );
                } else {
                  return const CustomText(
                    text: 'Please Sign In',
                    fontWeight: FontWeight.w500,
                  );
                }
              },
            ),
            leading: BlocBuilder<AuthViewBloc, AuthViewState>(
              builder: (context, state) {
                if (state.isLoggedIn) {
                  return IconButton(
                    onPressed: () {
                      showAnimatedDialog(
                        animationType: DialogTransitionType.fadeScale,
                        duration: const Duration(milliseconds: 500),
                        context: context,
                        builder: (BuildContext context) {
                          return const SignOutDialog();
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                    ),
                  );
                } else {
                  return IconButton(
                    onPressed: () => authViewBloc.add(
                      const NavigateToPageEvent(
                        route: LoginScreenRoute(),
                      ),
                    ),
                    icon: const Icon(
                      Icons.account_box,
                    ),
                  );
                }
              },
            ),
          ),
          //backgroundColor: theme.colorScheme.background,
          body: Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.inversePrimary,
                  theme.colorScheme.inverseSurface,
                ],
              ),
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              children: const <Widget>[
                ThemeListTile(),
                SizedBox(
                  height: 12,
                ),
                TextSizeListTile(),
                SizedBox(
                  height: 12,
                ),
                AboutUsTile(),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 400,
                  child: SinglePlacemarkMap(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

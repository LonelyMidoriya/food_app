import 'package:auth_view/auth_view.dart';
import 'package:core/core.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';
import 'package:settings_view/src/widget/about_us_tile.dart';
import 'package:settings_view/src/widget/text_size_list_tile.dart';
import 'package:settings_view/src/widget/theme_list_tile.dart';

class SettingsViewScreen extends StatelessWidget {
  const SettingsViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AnimatedTheme(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      data: theme,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<AuthViewBloc, AuthViewState>(
              builder: (context, state) {
                if (state.isLoggedIn) {
                  return CustomText(
                    text: firebaseAuth.currentUser!.email!,
                    fontWeight: FontWeight.w500,
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
                      BlocProvider.of<AuthViewBloc>(context).add(
                        UserSignoutEvent(),
                      );
                      appRouter.navigate(
                        const LoginScreenRoute(),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                    ),
                  );
                } else {
                  return IconButton(
                    onPressed: () {
                      appRouter.navigate(
                        const LoginScreenRoute(),
                      );
                    },
                    icon: const Icon(
                      Icons.account_box,
                    ),
                  );
                }
              },
            ),
          ),
          backgroundColor: theme.colorScheme.background,
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            children: const <Widget>[
              ThemeListTile(),
              Divider(),
              TextSizeListTile(),
              Divider(),
              AboutUsTile(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return WillPopScope(
      child: AnimatedTheme(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        data: theme,
        child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: SafeArea(
            child: BlocListener<AuthViewBloc, AuthViewState>(
              listener: (BuildContext context, AuthViewState state){
                if (state.isLoggedIn) {
                  if (state.user.isAdmin) {
                    BlocProvider.of<OrdersViewBloc>(context).add(
                      InitAdminOrdersEvent(),
                    );
                    if (state.user.isSuperAdmin) {
                      BlocProvider.of<AdminControlPanelBloc>(context).add(
                        AdminControlPanelInitEvent(),
                      );
                      appRouter.navigate(
                        const SuperAdminHomePageRoute(),
                      );
                    } else {
                      appRouter.navigate(
                        const AdminHomePageRoute(),
                      );
                    }
                  } else {
                    BlocProvider.of<OrdersViewBloc>(context).add(
                      InitOrdersEvent(),
                    );
                    BlocProvider.of<CartViewBloc>(context).add(
                      InitCartEvent(),
                    );
                    appRouter.navigate(
                      const HomePageRoute(),
                    );
                  }
                } else {
                  appRouter.navigate(
                    const LoginScreenRoute(),
                  );
                }
              },
              child: const Center(
                child: AppLoaderCenterWidget(),
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
